#################################################################################################################
# REQUIRED VARIABLES
#################################################################################################################

variable "resource_group_name" {
  type        = string
  description = "The name of the Azure resource group in which resources will be deployed."
}

variable "resource_group_location" {
  type        = string
  description = "The Azure region where the resource group will be created."
}

variable "subnet_id" {
  type        = string
  description = "The ID of the subnet where the virtual machine will be deployed."
}

variable "network_interface_name" {
  type        = string
  description = "The name of the network interface to associate with the virtual machine."
}

variable "ip_configuration_name" {
  type        = string
  description = "The name of the IP configuration for the network interface."
}

variable "vm_name" {
  type        = string
  description = "The name of the virtual machine instance."
}

variable "storage_os_disk_name" {
  type        = string
  description = "The name assigned to the OS disk."
}

variable "os_profile_computer_name" {
  type        = string
  description = "The hostname of the virtual machine."
}

variable "os_profile_admin_username" {
  type        = string
  description = "The administrator username for the virtual machine."
}

variable "os_profile_admin_password" {
  type        = string
  description = "The administrator password for the virtual machine. Use environment variables or a secret manager instead."
}

variable "network_security_group_id" {
  type        = string
  description = "ID of network security group"
}

#################################################################################################################
# OPTIONAL VARIABLES (WITH DEFAULT VALUES)
#################################################################################################################

variable "vm_size" {
  type        = string
  description = "Specifies the size of the virtual machine."
  default     = "Standard_B4ms"
}

variable "storage_os_disk_caching" {
  type        = string
  description = "Defines the caching policy for the OS disk (e.g., ReadOnly, ReadWrite)."
  default     = "ReadWrite"
}

variable "storage_os_disk_create_option" {
  type        = string
  description = "Determines how the OS disk should be created (e.g., FromImage, Attach, Empty)."
  default     = "FromImage"
}

variable "storage_os_disk_managed_disk_type" {
  type        = string
  description = "Defines the type of managed disk for the OS disk (e.g., Premium_LRS, Standard_LRS)."
  default     = "Premium_LRS"
}

variable "custom_image_sku" {
  type        = string
  description = "The custom image SKU (name)."
}

variable "custom_image_resource_group_name" {
  type        = string
  description = "The custom image resource group."
}
