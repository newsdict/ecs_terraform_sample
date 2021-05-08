variable "identifier" {
  default = "sample"
}
variable "environment" {
  default = "dev"
}
variable "ecs_iam_role_arn" {
  type = any
}
variable "alb_target_group_arns" {
  type = any
}
variable "subnet_ids" {
  type = list
}
variable "security_group_ids" {
  type = list
}
variable "ecs_desired_count" {
  type = number
  default = 1
}
variable "ecs_container_port" {
  type = number
  default = 80
}
variable "ecs_cpu" {
  type = number
  default = 256
}
variable "ecs_memory" {
  type = number
  default = 512
}