resource "aws_ecs_cluster" "this" {
  name = var.name

  # Conferir isso \/
  setting {
    name  = "containerInsights"
    value = "disabled"
  }

  tags = {
    Name = var.name
  }
}
