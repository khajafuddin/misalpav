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

module "vm1" {
  source = "./m1"
  groupname = "wipro-commandos"
region    = "eastus"
name      = "wipro-heros"
address   = ["3.3.3.0/24"]
subnets   = ["3.3.3.0/25","3.3.3.128/25"]
machines  = 1
names     = ["vm1-m1"]
}

module "vm2" {
  source = "./m2"
  groupname = "wipro-commandos"
region    = "eastus"
name      = "wipro-heros"
address   = ["4.3.3.0/24"]
subnets   = ["4.3.3.0/25", "4.3.3.128/25"]
machines  = 1
names     = ["vm1-m2"]
}
