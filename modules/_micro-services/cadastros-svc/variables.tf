variable "vpc_id" {}
variable "subnet_privada_id_a" {}
variable "subnet_privada_id_b" {}
variable "subnet_publica_id_a" {}
variable "subnet_publica_id_b" {}
variable "cluster_id" {}
variable "authorizer_id" {
  type = string
}

variable "app_name" {
  type = string
}

variable "client_scope_name" {
  type = string
}
