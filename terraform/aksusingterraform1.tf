terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.93.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "***"
  tenant_id       = "****"
  client_id       = "***"
  client_secret   = "**"
}

resource "azurerm_resource_group" "cka" {
  name     = "cka"
  location = "eastus"
}

resource "azurerm_kubernetes_cluster" "cka1" {
  name                = "cluster1"
  location            = azurerm_resource_group.cka.location
  resource_group_name = azurerm_resource_group.cka.name
  dns_prefix          = "exampleaks1"
  default_node_pool {
    name       = "vadapav"
    node_count = 2
    vm_size    = "Standard_B2ms"
  }
  identity {
    type = "SystemAssigned"
  }
}
