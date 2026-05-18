terraform {
  required_version = ">= 1.10"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket       = "appointments-scheduler-tfstate-035053465484"
    key          = "app/terraform.tfstate"
    region       = "us-east-1"
    profile      = "default"
    encrypt      = true
    use_lockfile = true
  }
}
