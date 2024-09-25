variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "The location/region where the resources will be created."
  type        = string
}

variable "vnet_name" {
  description = "The name of the virtual network."
  type        = string
}

variable "vnet_address_space" {
  description = "The address space that will be used by the virtual network."
  type        = list(string)
}

variable "subnet_name" {
  description = "The name of the subnet within the virtual network."
  type        = string
}

variable "address_prefixes" {
  description = "The address prefixes to be used for the subnet."
  type        = list(string)
}
