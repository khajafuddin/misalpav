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
  subscription_id = ""
  tenant_id       = ""
  client_id       = ""
  client_secret   = ""
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
