terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.14.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = var.resource_group
    storage_account_name = var.storage_account
    container_name       = var.container_name
    key                  = var.key
    # use_azuread_auth     = true
  }
}

provider "azurerm" {
  features {}

  

}

variable "subscription_id" {
  type = string
}

variable "client_id" {
  type = string
}

variable "client_secret" {
  type      = string
  sensitive = true
}

variable "tenant_id" {
  type = string
}
