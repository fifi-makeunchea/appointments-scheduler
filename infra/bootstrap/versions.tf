terraform {
  required_version = ">= 1.10"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "default"

  default_tags {
    tags = {
      Project   = "appointments-scheduler"
      ManagedBy = "terraform"
      Component = "tf-remote-state-bootstrap"
    }
  }
}
