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
 subscription_id = "7869862f-d28a-4869-ae00-17ce96a1935a"
  

}

