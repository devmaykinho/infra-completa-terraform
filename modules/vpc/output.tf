output "id" {
  value = aws_vpc.poc-infra-vpc.id
}

output "subnet_privada_id_a" {
  value = aws_subnet.poc-infra-subnet-privada-a.id
}

output "subnet_privada_id_b" {
  value = aws_subnet.poc-infra-subnet-privada-b.id
}

output "subnet_publica_id_a" {
  value = aws_subnet.poc-infra-subnet-publica-a.id
}

output "subnet_publica_id_b" {
  value = aws_subnet.poc-infra-subnet-publica-b.id
}