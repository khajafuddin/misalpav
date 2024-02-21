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

resource "azurerm_resource_group" "dosa" {
  name     = var.groupname
  location = var.region
}

resource "azurerm_virtual_network" "dosa-net" {
  resource_group_name = azurerm_resource_group.dosa.name
  location            = azurerm_resource_group.dosa.location
  name                = var.name
  address_space       = var.address
}
resource "azurerm_subnet" "dosa-s1" {
  name = "subnet1-${var.name}"
  address_prefixes = [var.subnets[0]]
  virtual_network_name = azurerm_virtual_network.dosa-net.name
  resource_group_name = azurerm_resource_group.dosa.name
}
resource "azurerm_subnet" "dosa-s2" {
  name = "subnet2-${var.name}"
  address_prefixes = [var.subnets[1]]
  virtual_network_name = azurerm_virtual_network.dosa-net.name
  resource_group_name = azurerm_resource_group.dosa.name
}

resource "azurerm_network_interface" "dosa-nic" {
  name                = "nic-${var.name}"
  location            = var.region
  resource_group_name = azurerm_resource_group.dosa.name
  ip_configuration {
    name                          = "nic1-${var.name}"
    subnet_id                     = azurerm_subnet.dosa-s1.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "dosa-vm1" {
  name                            = "vm1-${var.name}"
  resource_group_name             = azurerm_resource_group.dosa.name
  location                        = azurerm_resource_group.dosa.location
  disable_password_authentication = false
  admin_username                  = "hexagon"
  admin_password                  = "Hexagon@123"
  size                            = "Standard_B1ms"
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
  network_interface_ids = [azurerm_network_interface.dosa-nic.id]
}

