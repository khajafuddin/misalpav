terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.92.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "wipro-trainer1" {
  name     = "wipro-rg1-trainer"
  location = "eastus"
}

resource "azurerm_virtual_network" "wipro-trainer1-vnet1" {
  name                = "wipro-vnet1-trainer"
  resource_group_name = azurerm_resource_group.wipro-trainer1.name
  location            = azurerm_resource_group.wipro-trainer1.location
  address_space       = ["99.99.99.0/24"]
  subnet {
    name           = "subnet1"
    address_prefix = "99.99.99.0/25"
  }
  subnet {
    name           = "subnet2"
    address_prefix = "99.99.99.128/25"
  }

}
