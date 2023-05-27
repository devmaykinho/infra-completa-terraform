variable "name" {
  description = "Nome do target group"
  type        = string
}

variable "port" {
  type = number
}

variable "protocol" {
  type = string
}

variable "target_type" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "health_check" {
  type = map(string)
}


