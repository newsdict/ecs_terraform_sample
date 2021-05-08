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
variable "node_type" {
  default = "cache.t3.small"
}
variable "number_cache_clusters" {
  default = 1
}
variable "engine_version" {
  default = "5.0.6"
}
variable "at_rest_encryption_enabled" {
  default = true
}
variable "transit_encryption_enabled" {
  default = true
}
variable "auth_token" {
  default = "1234567890asdfghjkl"
}
variable "parameter_group_family" {
  default = "redis5.0"
}
variable "description" {
  default = "sample elasticache redis."
}
variable "security_group_ids" {
  type = list
}
variable "parameters" {
  type = list
  default = []
}