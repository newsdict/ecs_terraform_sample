# ref https://registry.terraform.io/modules/terraform-aws-modules/rds/aws/3.0.0
module "rds" {
  source  = "terraform-aws-modules/rds/aws"
  version = "3.0.0"

  identifier = "${var.identifier}-${var.environment}"

  engine            = var.engine
  engine_version    = var.engine_version
  instance_class    = var.instance_class
  allocated_storage = 5

  name     = var.db_name
  username = var.db_username
  password = var.db_password
  port     = "3306"

  iam_database_authentication_enabled = false

  vpc_security_group_ids = var.security_group_ids

  auto_minor_version_upgrade = false
  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"

  #monitoring_interval = "30"
  monitoring_role_name = "${var.identifier}-${var.monitoring_role_name}-${var.environment}"
  create_monitoring_role = true

  # DB subnet group
  subnet_ids = var.subnet_ids

  # DB parameter group
  family = var.db_parameter_group

  # DB option group
  major_engine_version = var.db_option_group

  # Database Deletion Protection
  deletion_protection = var.deletion_protection

  db_subnet_group_use_name_prefix = false
  db_subnet_group_name = "${var.identifier}-${var.environment}-subnet"

  parameter_group_use_name_prefix = false
  parameter_group_name = "${var.identifier}-${var.environment}-parameter"

  option_group_use_name_prefix = false
  option_group_name = "${var.identifier}-${var.environment}-option"

  parameters = var.parameters

  options = var.options
  
  tags = {
    Environment = var.environment
  }
}
