variable "vpc_id" {
  type = string
}
variable "subnet_ids" {
  type = list
}
variable "identifier" {
  default = "sample"
}
variable "environment" {
  default = "dev"
}
variable "security_group_ids" {
  type = list
}
variable "s3_bucket_id" {
  type = string
}
variable "deletion_protection" {
  type = bool
  default = false
}
variable "alb_certificate_arn" {
  type = string
}