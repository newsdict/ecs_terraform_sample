# ref https://registry.terraform.io/modules/umotif-public/elasticache-redis/aws/latest
module "redis" {
  source = "umotif-public/elasticache-redis/aws"
  version = "2.0.0"

  name_prefix           = "${var.identifier}-${var.environment}"
  number_cache_clusters = var.number_cache_clusters
  node_type             = var.node_type

  engine_version           = var.engine_version
  port                     = 6379
  
  auto_minor_version_upgrade = false
  maintenance_window       = "mon:03:00-mon:04:00"
  snapshot_window          = "04:00-06:00"
  snapshot_retention_limit = 7

  automatic_failover_enabled = true
  
  at_rest_encryption_enabled = var.at_rest_encryption_enabled
  transit_encryption_enabled = var.transit_encryption_enabled
  auth_token                 = var.auth_token

  apply_immediately = false
  family            = var.parameter_group_family
  description       = var.description

  subnet_ids = var.subnet_ids
  vpc_id     = var.vpc_id

  security_group_ids = var.security_group_ids

  parameter = var.parameters

  tags = {
    Environment = var.environment
  }
}