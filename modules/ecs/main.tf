resource "aws_ecr_repository" "main" {
  name = var.identifier
  image_tag_mutability = "IMMUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
}

# ref https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster
resource "aws_ecs_cluster" "main" {
  name = "${var.identifier}-${var.environment}"

  tags = {
    Environment = var.environment
  }
}

# ref https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition
# https://docs.aws.amazon.com/ja_jp/AmazonECS/latest/developerguide/task-cpu-memory-error.html
resource "aws_ecs_task_definition" "main" {
  family = "${var.identifier}-${var.environment}"
  container_definitions = jsonencode([
    {
      "name": "app",
      "image": aws_ecr_repository.main.repository_url,
      "essential": true,
      "portMappings": [
        {
          "containerPort": var.ecs_container_port,
          "hostPort": 80
        }
      ],
      "logConfiguration": {
        "logDriver": "awslogs",
        "options": {
          "awslogs-group": "/ecs/myapp",
          "awslogs-region": "us-west-1",
          "awslogs-stream-prefix": "ecs"
        }
      }
    }
  ])

  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = var.ecs_cpu
  memory                   = var.ecs_memory
  task_role_arn            = var.ecs_iam_role_arn
  execution_role_arn       = var.ecs_iam_role_arn
}

# ref https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service
resource "aws_ecs_service" "app" {
  name            = "${var.identifier}-${var.environment}-app"
  cluster         = aws_ecs_cluster.main.id
  
  task_definition = aws_ecs_task_definition.main.arn
  desired_count   = var.ecs_desired_count
  launch_type     = "FARGATE"
  
  network_configuration {
    security_groups = var.security_group_ids
    subnets = var.subnet_ids
  }

  load_balancer {
    target_group_arn = var.alb_target_group_arns[0]
    container_name   = "app"
    container_port   = var.ecs_container_port
  }

  lifecycle {
    ignore_changes = [desired_count, task_definition]
  }
}