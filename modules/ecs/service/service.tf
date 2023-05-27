resource "aws_ecs_service" "this" {
  name = var.name

  cluster         = var.cluster_id
  task_definition = var.task_definition_arn

  desired_count = var.desired_count

  launch_type          = var.launch_type
  force_new_deployment = var.force_new_deployment

  network_configuration {
    subnets         = var.network_configuration.subnets
    security_groups = var.network_configuration.security_groups
  }

  load_balancer {
    target_group_arn = var.load_balancer.target_group_arn
    container_name   = var.load_balancer.container_name
    container_port   = var.load_balancer.container_port
  }

  tags = {
    Name  = var.name
    Stack = var.launch_type
  }
}
