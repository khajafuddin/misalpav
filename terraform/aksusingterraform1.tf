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
  subscription_id = "3cbaa148-e656-4d14-9e1a-1cc42ce43d87"
  tenant_id       = "76b3bf13-6e67-4a78-8edc-b5b9e7e66fe8"
  client_id       = "31405e8d-3b22-457d-8183-db2251e16620"
  client_secret   = ".x48Q~_jNliaQ_5dkcA8r4grXi6XCg9Nboe2jbWD"
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
