resource "aws_ecs_task_definition" "this" {
  family                   = var.family_name_td
  requires_compatibilities = var.requires_compatibilities_td
  network_mode             = var.network_mode_td
  cpu                      = var.cpu_td
  memory                   = var.memory_td

  container_definitions = jsonencode([
    {
      name      = var.container_name_td
      image     = var.container_image_td
      cpu       = var.cpu_td
      memory    = var.memory_td
      essential = true
      portMappings = [
        {
          containerPort = var.container_port_td
          hostPort      = var.container_host_port_td
        }
      ]
    },
  ])

  runtime_platform {
    operating_system_family = var.operating_system_family_td
    cpu_architecture        = var.cpu_architecture_td
  }

  execution_role_arn = aws_iam_role.this.arn
}
