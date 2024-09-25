# Call the Resource Group module
module "resource_group" {
  source   = "../../terraform/modules/resource_group"
  name     = var.resource_group_name
  location = var.location
}

# Call the Virtual Network module
module "virtual_network" {
  source              = "../../terraform/modules/virtual_network"
  vnet_name           = var.vnet_name
  address_space       = ["10.0.0.0/16"]
  location            = "eastus"
  resource_group_name = module.resource_group.resource_group_name
  subnet_names        = var.subnet_name
  subnet_prefixes     = ["10.0.1.0/24"]
}
