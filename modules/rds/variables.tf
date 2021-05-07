variable "security_group" {
  type = string
}
variable "subnet_ids" {
  type = list
}
variable "identifier" {
  default = "sample"
}
variable "engine" {
  default = "mysql"
}
variable "engine_version" {
  default = "5.7.33"
}
variable "instance_class" {
  default = "db.t3.small"
}
variable "db_name" {
  default = "terraform"
}
variable "db_username" {
  default = "user"
}
variable "db_password" {
  default = "YourPwdShouldBeLongAndSecure!"
}
variable "environment" {
  default = "development"
}
variable "monitoring_role_name" {
  default = "rds-monitoring-role"
}
variable "db_parameter_group" {
  default = "mysql5.7"
}
variable "db_option_group" {
  default = "5.7"
}
variable "parameters" {
  default = [
    {
      name = "character_set_client"
      value = "utf8mb4"
    },
    {
      name = "character_set_server"
      value = "utf8mb4"
    }
  ]
}
variable "options" {
  default = [
    {
      option_name = "MARIADB_AUDIT_PLUGIN"

      option_settings = [
        {
          name  = "SERVER_AUDIT_EVENTS"
          value = "CONNECT"
        },
        {
          name  = "SERVER_AUDIT_FILE_ROTATIONS"
          value = "37"
        },
      ]
    },
  ]
}