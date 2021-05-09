variable "environment" {
  default = "development"
}
variable "identifier" {
  type = string
  default = "sample"
}
variable "vpc_id" {
  type = string
}
variable "prefix" {
  type = string
}
# rule) https://github.com/terraform-aws-modules/terraform-aws-security-group/blob/master/modules/README.md
variable "security_group_computed_ingress_with_sg" {
  type = list(map(string))
  default = []
}
variable "security_group_computed_ingress_with_cidr" {
  type = list(map(string))
  default = []
}
variable "security_group_ingress_with_sg" {
  type = list(map(string))
  default = []
}
variable "security_group_ingress_with_cidr" {
  type = list(map(string))
  default = []
}