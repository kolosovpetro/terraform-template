output "username" {
  value = var.os_profile_admin_username
}

output "password" {
  value     = var.os_profile_admin_password
  sensitive = true
}

output "network_interface_id" {
  value = azurerm_network_interface.public.id
}

output "ip_configuration_name" {
  value = var.ip_configuration_name
}

output "id" {
  value = azurerm_virtual_machine.public.id
}

output "user_assigned_identity_principal_id" {
  value = azurerm_user_assigned_identity.vm_mi.principal_id
}
