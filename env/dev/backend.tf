terraform {
  backend "azurerm" {
    resource_group_name   = "medx_base"
    storage_account_name  = "medxbase001"
    container_name        = "terraform"
    key                   = "terraform_dev.tfstate"  # This is the name of the state file
  }
}
