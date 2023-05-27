# MODULOS GLOBAIS
module "vpc" {
  source  = "./modules/vpc"
  app_name = "backhaul"  
}

module "cluster" {
  source = "./modules/ecs/cluster"

  name = "backhaul"
}

module "cognito" {
  source   = "./modules/cognito"
  app_name = var.app_name
  client_scope_name = var.client_scope_name
}

# MODULOS POR SERVIÇOS
module "name" {
  source = "./modules/_micro-services/cadastros-svc"
  vpc_id = module.vpc.id
  cluster_id = module.cluster.id
  app_name = var.app_name
  authorizer_id       = module.cognito.arn
  client_scope_name = var.client_scope_name
  subnet_privada_id_a = module.vpc.subnet_privada_id_a
  subnet_privada_id_b = module.vpc.subnet_privada_id_b
  subnet_publica_id_a = module.vpc.subnet_publica_id_a
  subnet_publica_id_b = module.vpc.subnet_publica_id_b
}