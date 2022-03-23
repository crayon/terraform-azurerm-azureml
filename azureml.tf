resource "azurerm_machine_learning_workspace" "main" {
  name                = format("aml-%s", var.name)
  resource_group_name = data.azurerm_resource_group.main.name
  location            = data.azurerm_resource_group.main.location

  application_insights_id = var.application_insights_create == true ? azurerm_application_insights.main[0].id : data.azurerm_application_insights.main[0].id
  key_vault_id            = var.key_vault_create == true ? azurerm_key_vault.main[0].id : data.azurerm_key_vault.main[0].id
  storage_account_id      = var.storage_account_create == true ? azurerm_storage_account.main[0].id : data.azurerm_storage_account.main[0].id
  container_registry_id   = var.container_registry_create == true ? azurerm_container_registry.main[0].id : data.azurerm_container_registry.main[0].id

  public_network_access_enabled = var.azureml_public_access

  identity {
    type = "SystemAssigned"
  }

  tags = var.tags

}
