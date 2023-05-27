output "arn" {
  value = aws_ecs_task_definition.this.arn
}

output "container_name" {
  value = jsondecode(aws_ecs_task_definition.this.container_definitions)[0].name
}


