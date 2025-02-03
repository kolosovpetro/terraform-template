data "azurerm_client_config" "current" {}
data "azurerm_subscription" "current" {}

resource "azurerm_resource_group" "public" {
  location = var.location
  name     = "${var.resource_group_name}-${var.prefix}"
  tags     = var.tags
}

module "resource_group" {
  source                  = "./modules/example_submodule"
  resource_group_location = var.location
  resource_group_name     = "rg-from-module-${var.prefix}"
}
