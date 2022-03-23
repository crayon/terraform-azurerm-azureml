resource "azurerm_container_registry" "main" {
  count               = var.container_registry_create == true ? 1 : 0
  name                = format("acr%s", replace(var.name, "-", ""))
  resource_group_name = data.azurerm_resource_group.main.name
  location            = data.azurerm_resource_group.main.location

  admin_enabled = true
  sku           = var.container_registry_sku

  identity {
    type = "SystemAssigned"
  }

  tags = var.tags
}
