variable "name" {
  description = "Nome do service"
  type        = string
}

variable "cluster_id" {
  description = "ID do cluster onde vamos criar o service"
  type        = string
}

variable "task_definition_arn" {
  description = "ARN da task definition que vamos usar no service"
  type        = string
}

variable "desired_count" {
  default     = 2
  description = "Quantidade de maquinas que vai ser executado no service"
  type        = number
}

variable "force_new_deployment" {
  default = false
  type    = bool
}

variable "launch_type" {
  default = "FARGATE"
  type    = string
}

variable "network_configuration" {
  type = object({
    subnets         = list(string)
    security_groups = list(string)
  })
}

variable "load_balancer" {
  type = object({
    target_group_arn = string
    container_name   = string
    container_port   = number
  })
}
