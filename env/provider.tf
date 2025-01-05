terraform{
    required_version = ">= 1.0.0"
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = ">= 4.0.0"
        }
    }
    backend "remote" {  
        hostname = "app.terraform.io"
        organization = "Pawan7409"
        workspaces {
            name = "shikar_env"
        }
    }
}

provider "azurerm" {
    features {}
}