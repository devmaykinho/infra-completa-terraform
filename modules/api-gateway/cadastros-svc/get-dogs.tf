resource "aws_api_gateway_method" "integracoes_dogs" {
  rest_api_id   = var.rest_api_id
  resource_id   = aws_api_gateway_resource.integracoes_dogs.id
  http_method   = "GET"
  authorization = "COGNITO_USER_POOLS"
  authorizer_id = var.authorizer_id
  authorization_scopes = [ "${var.app_name}/${var.custom_scope_name}" ]
}

resource "aws_api_gateway_integration" "integracoes_dogs_get" {
  rest_api_id = var.rest_api_id
  resource_id = aws_api_gateway_resource.integracoes_dogs.id
  http_method = "GET"

  type                    = "HTTP_PROXY"
  integration_http_method = "GET"
  uri                     = "http://$${stageVariables.loadBalancerCadastrosSvc}/dogs"
  connection_type         = "VPC_LINK"
  connection_id           = var.vpc_link_id
  passthrough_behavior    = "WHEN_NO_MATCH"

  depends_on = [aws_api_gateway_method.integracoes_dogs]
}
