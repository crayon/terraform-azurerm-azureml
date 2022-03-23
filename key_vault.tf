resource "azurerm_key_vault" "main" {
  count               = var.container_registry_create == true ? 1 : 0
  name                = format("kv-%s", var.name)
  resource_group_name = data.azurerm_resource_group.main.name
  location            = data.azurerm_resource_group.main.location
  tenant_id           = data.azurerm_client_config.current.tenant_id

  sku_name                   = var.key_vault_sku
  soft_delete_retention_days = 7

  tags = var.tags
}
