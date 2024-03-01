terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.94.0"
    }
  }
}

provider "azurerm" {
  features {

  }
  # Configuration options
}

variable "storage" {
  description = "creating storage accout"
  type        = bool

}

resource "azurerm_resource_group" "rg1" {
  name     = "rg1"
  location = "eastus"

}
resource "azurerm_storage_account" "str1" {
  count                    = var.storage ? 1 : 0
  resource_group_name      = azurerm_resource_group.rg1.name
  location                 = azurerm_resource_group.rg1.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  name                     = "vadapav${count.index}"
}
