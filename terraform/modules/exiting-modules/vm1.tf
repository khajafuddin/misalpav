module "virtual-machine_example_basic" {
  source                = "Azure/virtual-machine/azurerm//examples/basic"
  version               = "1.1.0"
  create_public_ip      = true
  my_public_ip          = "samosa-ip"
  create_resource_group = true
  resource_group_name   = "samosa-trainer"
  location              = "eastus"
  size                  = "Standard_B1ms"
}
