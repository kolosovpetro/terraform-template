data "azurerm_client_config" "current" {}
data "azurerm_subscription" "current" {}

module "azure_region" {
  source       = "claranet/regions/azurerm"
  version      = ">=7.0.0"
  azure_region = var.location
}

resource "azurerm_resource_group" "public" {
  location = module.azure_region.location_cli
  name     = "${var.resource_group_name}-${var.prefix}"
  tags     = var.tags
}

module "resource_group" {
  source                  = "./modules/example_submodule"
  resource_group_location = module.azure_region.location_cli
  resource_group_name     = "rg-from-module-${var.prefix}"
}
