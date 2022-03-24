output "azureml_workspace_id" {
  value = azurerm_machine_learning_workspace.main.id
}

output "application_insights_id" {
  value = var.application_insights_create == true ? azurerm_application_insights.main[0].id : data.azurerm_application_insights.main[0].id
}

output "container_registry_id" {
  value = var.container_registry_create == true ? azurerm_container_registry.main[0].id : data.azurerm_container_registry.main[0].id
}

output "key_vault_id" {
  value = var.key_vault_create == true ? azurerm_key_vault.main[0].id : data.azurerm_key_vault.main[0].id
}

output "storage_account_id" {
  value = var.storage_account_create == true ? azurerm_storage_account.main[0].id : data.azurerm_storage_account.main[0].id
}
