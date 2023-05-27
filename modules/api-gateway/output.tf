output "api_gateway_id" {
  value = aws_api_gateway_rest_api.this.id
}

output "api_gateway_root_resource_id" {
  value = aws_api_gateway_rest_api.this.root_resource_id
}

output "vpc_link_id" {
  value = aws_api_gateway_vpc_link.vpc_link.id
}