resource "azurerm_application_insights" "main" {
  count               = var.application_insights_create == true ? 1 : 0
  name                = format("apin-%s", var.name)
  resource_group_name = data.azurerm_resource_group.main.name
  location            = data.azurerm_resource_group.main.location

  application_type  = "other"
  retention_in_days = var.application_insights_retention_days

  workspace_id               = var.application_insights_log_analytics.name != null ? data.azurerm_log_analytics_workspace.main[0].id : null
  internet_ingestion_enabled = var.application_insights_public_ingest
  internet_query_enabled     = var.application_insights_public_ingest

  tags = var.tags
}
