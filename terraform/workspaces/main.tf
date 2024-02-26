 5 terraform workspace show
   6 terraform workspace new dev
   7 terraform workspace show
   8 terraform workspace list
   9 terraform workspace new uat
  10 terraform workspace new prod
  11 terraform workspace list
  12 terraform workspace delete default
  13 terraform workspace select dev
  15 terraform workspace select uat
  16 terraform workspace list
  17 terraform validate
  18 terraform plan
  19 terraform apply
  20 terraform workspace select dev
  21 terraform apply
  22 terraform workspace select prod
  23 terraform apply
  24 terraform workspace list

==============================
main.tf
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

resource "azurerm_resource_group" "rg1" {
  name     = "${terraform.workspace}-rg1"
  location = "eastus"
  
}



  
