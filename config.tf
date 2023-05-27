terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.64"
    }
  }
}

provider "aws" {
  access_key = "AKIA3PW3EGHKB6UDJHCN"
  secret_key = "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"
  region     = "us-east-2"

  default_tags {
    tags = {
      "Terraform" = "True"
    }
  }
}

