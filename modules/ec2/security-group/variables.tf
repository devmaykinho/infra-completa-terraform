variable "name" {
  description = "Nome do load balance"
  type        = string
}

variable "description" {
  description = "Descrição do load balance"
  type        = string
}


variable "vpc_id" {
  description = "VPC do load balance"
  type        = string
}


variable "ingress_rules" {
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "egress_rules" {
  type = list(object({
    from_port        = number
    to_port          = number
    protocol         = string
    cidr_blocks      = list(string)
    ipv6_cidr_blocks = list(string)
  }))
}
