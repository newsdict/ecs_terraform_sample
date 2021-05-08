# ref https://registry.terraform.io/modules/terraform-aws-modules/alb/aws/6.0.0
module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "6.0.0"

  name = "${var.identifier}-${var.environment}"

  load_balancer_type = "application"
  
  enable_deletion_protection = var.deletion_protection

  vpc_id             = var.vpc_id
  subnets            = var.subnet_ids
  security_groups    = var.security_group_ids

  access_logs = {
    bucket = var.s3_bucket_id
  }

  target_groups = [
    {
      name = "${var.identifier}-${var.environment}"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "ip"
      health_check = {
        path = "/"
      }

      lifecycle = {
        create_before_destroy = true
      }
    }
  ]

  https_listeners = [
    {
      port               = 443
      protocol           = "HTTPS"
      certificate_arn    = var.alb_certificate_arn
      target_group_index = 0
    }
  ]

  #http_tcp_listeners = [
  #  {
  #    port               = 80
  #    protocol           = "HTTP"
  #    target_group_index = 0
  #  }
  #]

  tags = {
    Environment = var.environment
  }
}