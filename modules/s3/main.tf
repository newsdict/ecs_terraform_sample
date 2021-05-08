# ref https://registry.terraform.io/modules/terraform-aws-modules/s3-bucket/aws/2.1.0
module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"
  version = "2.1.0"

  bucket = "${var.s3_prefix}-${var.identifier}-${var.environment}"
  acl = var.acl
  attach_elb_log_delivery_policy = true
  versioning = {
    enabled = true
  }

  lifecycle_rule = [{
    id = "log"
    prefix  = "log/"
    enabled = true

    transition = [
      {
        days          = 30
        storage_class = "ONEZONE_IA"
        }, {
        days          = 60
        storage_class = "GLACIER"
      }
    ]

    expiration = {
      days = 90
    }

    noncurrent_version_expiration = {
      days = 30
    }
  }]
  
  tags = {
    Environment = var.environment
  }
}