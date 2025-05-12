resource "azurerm_network_interface" "public" {
  name                = var.network_interface_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = var.ip_configuration_name
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

data "azurerm_image" "search" {
  name                = var.custom_image_sku
  resource_group_name = var.custom_image_resource_group_name
}

# Assume a Linux VM with a user-assigned managed identity
resource "azurerm_user_assigned_identity" "vm_mi" {
  name                = "vm-mi-d01"
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
}

resource "azurerm_virtual_machine" "public" {
  name                  = var.vm_name
  location              = var.resource_group_location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.public.id]
  vm_size               = var.vm_size

  delete_os_disk_on_termination = true

  storage_image_reference {
    id = data.azurerm_image.search.id
  }

  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.vm_mi.id]
  }

  storage_os_disk {
    name              = var.storage_os_disk_name
    caching           = var.storage_os_disk_caching
    create_option     = var.storage_os_disk_create_option
    managed_disk_type = var.storage_os_disk_managed_disk_type
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  os_profile {
    computer_name  = var.os_profile_computer_name
    admin_username = var.os_profile_admin_username
    admin_password = var.os_profile_admin_password
  }

  depends_on = [
    azurerm_network_interface_security_group_association.nic_association
  ]
}

resource "azurerm_network_interface_security_group_association" "nic_association" {
  network_interface_id      = azurerm_network_interface.public.id
  network_security_group_id = var.network_security_group_id
}
