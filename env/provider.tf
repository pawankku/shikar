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
    # use_azuread_auth     = true
  }
}

provider "azurerm" {
  features {}

  # Use environment variables or specify credentials directly here:
  subscription_id = "7869862f-d28a-4869-ae00-17ce96a1935a"
  client_id       = "957f7280-3f81-4cbf-a46f-349147ff81a8"
  client_secret   = "154fb5d1-129d-40aa-9ca4-a49fc898c55e"
  tenant_id       = "be817ec6-52af-4f3c-b65a-504f7f6a30fa"

  # Or use Azure CLI authentication:
#   use_azure_cli_authentication = true
}
