output "resource_group_name" {
  description = "name of the resource group"
  value       = azurerm_resource_group.rg.name
}

output "resource_group_id" {
  description = "id of the resource group"
  value       = azurerm_resource_group.rg.id
}
