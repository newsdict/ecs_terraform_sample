variable "identifier" {
  default = "sample"
}
variable "environment" {
  default = "dev"
}
# The canned ACL to apply.
# Valid values are private, public-read, public-read-write, aws-exec-read, authenticated-read, and log-delivery-write. Defaults to private. Conflicts with grant.
variable "acl" {
  default = "log-delivery-write"
}
variable "s3_prefix" {
  default = "alb-logs"
}