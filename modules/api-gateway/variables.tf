variable "description" {
  type = string
}

variable "types" {
  type = list(string)
}

variable "binary_media_types" {
  type = list(string)
}

variable "minimum_compression_size" {
  type = number
}

variable "deployment_description" {
  type = string
}

variable "stage_name" {
  type = string
}

variable "load_balance_arn" {
    type = list(string)
}

variable "load_balancer_variables" {
  type = map(string)
}

variable "authorizer_id" {
  type = string
}

variable "app_name" {
  type = string
}
  
variable "client_scope_name" {}  