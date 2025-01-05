terraform {
    required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.14.0"
    }
    azurerm = {
        source = "hashicorp/azurerm"
        version = "3.0.2"
    }
  }

  backend "azurerm" {
    hostname             = "storage53637337.blob.core.windows.net"
    organization         = "pawan"
    workspace_key_prefix = "pawan"
    workspaces {
        name = "pawan"
    }
  }
}

provider "azurerm" {
  features {}
 subscription_id = "7869862f-d28a-4869-ae00-17ce96a1935a"
  

}

