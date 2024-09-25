variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string
}

variable "address_space" {
  description = "The address space for the virtual network"
  type        = list(string)
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "subnet_names" {
  description = "List of subnet names"
  type        = list(string)
}

variable "subnet_prefixes" {
  description = "CIDR blocks for the subnets"
  type        = list(string)
}
