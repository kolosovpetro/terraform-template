data "azurerm_client_config" "current" {}
data "azurerm_subscription" "current" {}

module "naming" {
  source = "Azure/naming/azurerm"
  suffix = ["template", var.prefix]
}

#################################################################################################################
# LOCALS
#################################################################################################################

locals {
  vnet_cidr           = ["10.10.0.0/24"]
  vm_subnet_cidr      = ["10.10.0.0/26"]
  fw_subnet_cidr      = ["10.10.0.64/26"]
  bastion_subnet_cidr = ["10.10.0.128/26"]
}

#################################################################################################################
# RESOURCE GROUP
#################################################################################################################

resource "azurerm_resource_group" "public" {
  location = var.location
  name     = module.naming.resource_group.name_unique
  tags     = var.tags
}

#################################################################################################################
# VNET AND SUBNET
#################################################################################################################

resource "azurerm_virtual_network" "public" {
  name                = module.naming.virtual_network.name
  address_space       = local.vnet_cidr
  location            = azurerm_resource_group.public.location
  resource_group_name = azurerm_resource_group.public.name
}

resource "azurerm_subnet" "vm" {
  name                 = module.naming.subnet.name_unique
  resource_group_name  = azurerm_resource_group.public.name
  virtual_network_name = azurerm_virtual_network.public.name
  address_prefixes     = local.vm_subnet_cidr
}

resource "azurerm_subnet" "fw" {
  name                 = "AzureFirewallSubnet"
  resource_group_name  = azurerm_resource_group.public.name
  virtual_network_name = azurerm_virtual_network.public.name
  address_prefixes     = local.fw_subnet_cidr
}

resource "azurerm_subnet" "bastion_snet" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = azurerm_resource_group.public.name
  virtual_network_name = azurerm_virtual_network.public.name
  address_prefixes     = local.bastion_subnet_cidr
}
