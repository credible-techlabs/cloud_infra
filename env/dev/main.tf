module "resource_group" {
  source   = "../../module/resource_group"
  name     = var.resource_group_name
  location = var.location
}