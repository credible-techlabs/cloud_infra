terraform {
  backend "azurerm" {
    resource_group_name   = "medx_base"
    storage_account_name  = "bootstrapdev0001"
    container_name        = "terraform"
    key                   = "terraform.tfstate"
  }
}