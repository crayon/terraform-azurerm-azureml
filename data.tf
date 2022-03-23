data "azurerm_client_config" "current" {}

data "azurerm_resource_group" "main" {
  name = var.resource_group_name
}

data "azurerm_application_insights" "main" {
  count               = var.application_insights_create == true ? 0 : 1
  name                = var.application_insights_existing.name
  resource_group_name = var.application_insights_existing.resource_group
}

data "azurerm_container_registry" "main" {
  count               = var.container_registry_create == true ? 0 : 1
  name                = var.container_registry_existing.name
  resource_group_name = var.container_registry_existing.resource_group
}

data "azurerm_key_vault" "main" {
  count               = var.key_vault_create == true ? 0 : 1
  name                = var.key_vault_existing.name
  resource_group_name = var.key_vault_existing.resource_group
}

data "azurerm_log_analytics_workspace" "main" {
  count               = var.application_insights_log_analytics.name != null ? 1 : 0
  name                = var.application_insights_log_analytics.name
  resource_group_name = var.application_insights_log_analytics.resource_group
}

data "azurerm_storage_account" "main" {
  count               = var.storage_account_create == true ? 0 : 1
  name                = var.storage_account_existing.name
  resource_group_name = var.storage_account_existing.resource_group
}
