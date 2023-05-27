#############################
## Task Definition
#############################

variable "family_name_td" {
  description = "Nome da task definition"
  type        = string
}

variable "requires_compatibilities_td" {
  default = ["FARGATE"]
  type    = list(string)
}

variable "network_mode_td" {
  default = "awsvpc"
  type    = string
}

variable "cpu_td" {
  default = 256
  type    = number
}

variable "memory_td" {
  default = 512
  type    = number
}

variable "operating_system_family_td" {
  default = "LINUX"
  type    = string
}

variable "cpu_architecture_td" {
  default = "X86_64"
  type    = string
}

#############################
## Task Definition  - Container
#############################

variable "container_name_td" {
  type = string
}

variable "container_image_td" {
  type = string
}

variable "container_port_td" {
  default = 80
  type    = number
}

variable "container_host_port_td" {
  default = 80
  type    = number
}

#############################
## IAM Policy
#############################

variable "iam_role_name" {
  type = string
}

variable "iam_role_version" {
  default = "2012-10-17"
  type    = string
}

variable "iam_policy_name" {
  type = string
}

variable "iam_policy_version" {
  default = "2012-10-17"
  type    = string
}
