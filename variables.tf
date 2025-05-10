variable "location" {
  type        = string
  description = "Resource group location"
  default     = "northeurope"
}

variable "prefix" {
  type        = string
  description = "Prefix for all resources"
  default     = "d01"
}

variable "subscription_id" {
  type        = string
  description = "Azure subscription ID"
  default     = "f32f6566-8fa0-4198-9c91-a3b8ac69e89a" # or 1b08b9a2-ac6d-4b86-8a2f-8fef552c8371
}

variable "tags" {
  type        = map(string)
  description = "Tags for all resources"
  default = {
    Environment  = "DEV"
    Owner        = "Terraform"
    Autoshutdown = "OFF"
  }
}


#################################################################################################################
# RBAC VARIABLES
#################################################################################################################

variable "azure_portal_client_id" {
  type        = string
  description = "Azure Portal client ID. For RBAC policies."
  default     = "89ab0b10-1214-4c8f-878c-18c3544bb547"
}

variable "tenant_id" {
  type        = string
  description = "Azure Tenant ID for authentication."
  default     = "b40a105f-0643-4922-8e60-10fc1abf9c4b"
}

variable "client_id" {
  type        = string
  description = "Azure Client ID (Service Principal) used for authentication."
  default     = "4d65956c-5661-494f-9e7e-c171aec0e53f"
}
