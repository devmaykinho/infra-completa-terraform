module "ecr" {
  source = "../../ecr"

  name_ecr = local.service_name #"cadastros-svc"
}

module "task-definition" {
  source = "../../ecs/task-definition"

  family_name_td     = local.service_name #"cadastros-svc"
  container_name_td  = local.service_name #"cadastros-svc"
  container_image_td = module.ecr.repository_url
  iam_role_name      = "ecs_task_role_cadastros"
  iam_policy_name    = "ecr_access_policy_cadastros"

  depends_on = [
    module.ecr,
  ]
}

module "service" {
  source = "../../ecs/service"

  name                 = local.service_name #"service-cadastros-svc"
  cluster_id           = var.cluster_id
  task_definition_arn  = module.task-definition.arn
  force_new_deployment = true

  network_configuration = {
    subnets = [var.subnet_privada_id_a, var.subnet_privada_id_b]
    security_groups = [
      module.security_group_http.id,
    ]
  }

  load_balancer = {
    target_group_arn = module.target_group.arn
    container_name   = module.task-definition.container_name
    container_port   = 80
  }

  depends_on = [module.task-definition]
}

module "security_group_http" {
  source = "../../ec2/security-group"

  name        = "http_https"
  description = "Permitindo trafego http e https"
  vpc_id      = var.vpc_id

  ingress_rules = [
    {
      description = "HTTPS Allowed"
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      description = "HTTP Allowed"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]

  egress_rules = [
    {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }
  ]
}

module "target_group" {
  source = "../../ec2/target-group"

  name        = local.service_name #"backhaul-cadastros"
  port        = 80
  protocol    = "TCP"
  target_type = "ip"
  vpc_id      = var.vpc_id

  health_check = {
    path = "/"
    port = 80
  }
}


module "load_balance" {
  source = "../../ec2/load-balance"

  name               = local.service_name #"backhaul-cadastros-svc"
  internal           = false
  load_balancer_type = "network"

  security_groups = [module.security_group_http.id]
  subnets         = [var.subnet_privada_id_a, var.subnet_privada_id_b]
}


module "target_group_listener" {
  source = "../../ec2/target-group-listener"

  load_balancer_arn = module.load_balance.arn
  port              = 80
  protocol          = "TCP"

  default_action = {
    type             = "forward"
    target_group_arn = module.target_group.arn
  }
}


module "integracoes_api_gateway" {
  source = "../../api-gateway"

  app_name = var.app_name #"backhaul-integracoes"
  description              = "API criada para integrações entre os produtos"
  types                    = ["REGIONAL"]
  binary_media_types       = ["multipart/form-data"]
  minimum_compression_size = 0
  deployment_description   = "Deploy em dev"
  stage_name               = "dev"
  load_balance_arn = [module.load_balance.arn]
  authorizer_id            = var.authorizer_id
  client_scope_name        = var.client_scope_name

  load_balancer_variables = {
    loadBalancerCadastrosSvc = module.load_balance.dns_name
  }
}
