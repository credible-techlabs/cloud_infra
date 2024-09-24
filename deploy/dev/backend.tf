terraform {
  backend "azurerm" {
    resource_group_name   = "bootstrap_dev"
    storage_account_name  = "medxdev0001"
    container_name        = "devterraform"
    key                   = "terraform.tfstate"
  }
}