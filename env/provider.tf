terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.14.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "pawan-rg"
    storage_account_name = "storage53637337"
    container_name       = "container"
    key                  = "prod.terraform.tfstate"
    use_azuread_auth     = true
  }
}

provider "azurerm" {
  features {}

  # Use environment variables or specify credentials directly here:
  # subscription_id = "your-subscription-id"
  # client_id       = "your-client-id"
  # client_secret   = "your-client-secret"
  # tenant_id       = "your-tenant-id"

  # Or use Azure CLI authentication:
  use_azure_cli_authentication = true
}
