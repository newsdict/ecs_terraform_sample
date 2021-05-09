module "security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.0.0"
  
  vpc_id = var.vpc_id
  
  name = "${var.identifier}-${var.prefix}-sg-${var.environment}"
  description = "Security Group of Rds on ${var.environment}"

  ingress_with_source_security_group_id = var.security_group_ingress_with_sg
  
  ingress_with_cidr_blocks = var.security_group_ingress_with_cidr
  
  computed_ingress_with_cidr_blocks = var.security_group_computed_ingress_with_cidr
  number_of_computed_ingress_with_cidr_blocks = length(var.security_group_computed_ingress_with_cidr)
  
  computed_ingress_with_source_security_group_id = var.security_group_computed_ingress_with_sg
  number_of_computed_ingress_with_source_security_group_id = length(var.security_group_computed_ingress_with_sg)
  
  egress_cidr_blocks      = ["0.0.0.0/0"]
  egress_rules            = ["all-all"]
  
  tags = {
    Environment = var.environment
  }
}