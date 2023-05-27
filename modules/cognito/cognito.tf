resource "aws_cognito_user_pool" "this" {
  name                = var.app_name
  username_attributes = ["email"]
}

resource "aws_cognito_user_pool_domain" "this" {
  domain       = var.app_name #"backhaul-authorization"
  user_pool_id = aws_cognito_user_pool.this.id

  # Configurações adicionais do domínio, se necessário
}


resource "aws_cognito_resource_server" "this" {
  identifier = var.app_name#"backhaul-authorization"
  name       = var.app_name#"backhaul-authorization"

  scope {
     scope_name        = var.client_scope_name # Nome do escopo
     scope_description = "Escopo de autorização"
  }

  user_pool_id = aws_cognito_user_pool.this.id
}

resource "aws_cognito_user_pool_client" "this" {
  name                                 = var.app_name
  user_pool_id                         = aws_cognito_user_pool.this.id
  generate_secret                      = true
  allowed_oauth_flows_user_pool_client = true
  allowed_oauth_scopes                 = ["email", "openid"]
  # TO_DO: DESCOBRIR COMO VINCULAR O CUSTOM ESCOPO AO APP CLIENT
  allowed_oauth_flows                  = ["implicit"]
  callback_urls                        = ["http://localhost"]
  supported_identity_providers         = ["COGNITO"]

  depends_on = [ 
    aws_cognito_resource_server.this
   ]

}

