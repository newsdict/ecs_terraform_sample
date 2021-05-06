# Specifies the aws credential information. 
#  Using the `terraform` profile. 
provider "aws" {
  region  = "us-east-1"
  profile = "terraform"
}

#module "alb" {
#  source  = "../../../modules/alb"
#}
#module "redis" {
#  source  = "../../../modules/redis"
#}
#module "ecs" {
#  source  = "../../../modules/ecs"
#}
#module "rds" {
#  source  = "../../../modules/rds"
#}