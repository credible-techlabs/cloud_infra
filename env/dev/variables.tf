# Define variables for resource group name and location
variable "resource_group_name" {
  type        = string
  description = "The name of the resource group"
  default     = "dev"
}

variable "location" {
  type        = string
  description = "The Azure region where the resource group will be created"
  default     = "eastus"
}
