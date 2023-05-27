resource "aws_lb_listener" "this" {
  load_balancer_arn = var.load_balancer_arn
  port              = var.port
  protocol          = var.protocol

  default_action {
    type             = var.default_action.type
    target_group_arn = var.default_action.target_group_arn
  }
}
