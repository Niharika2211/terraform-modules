terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.84.0"
    }
  }
}

terraform {
  backend "s3" {
    bucket         = "mini-exp-prod"
    key            = "sg/state.tf"
    region         = "us-east-1"
    dynamodb_table = "mini-exp-prod"
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "default"
}