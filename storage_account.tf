resource "azurerm_storage_account" "main" {
  count               = var.storage_account_create == true ? 1 : 0
  name                = format("sa%s", replace(var.name, "-", ""))
  resource_group_name = data.azurerm_resource_group.main.name
  location            = data.azurerm_resource_group.main.location

  account_kind             = var.storage_account_settings.kind
  account_replication_type = var.storage_account_settings.replication_type
  account_tier             = var.storage_account_settings.tier

  enable_https_traffic_only = true
  min_tls_version           = "TLS1_2"
  allow_blob_public_access  = false

  identity {
    type = "SystemAssigned"
  }

  dynamic "network_rules" {
    for_each = var.storage_account_network != null ? ["network"] : []
    content {
      default_action             = var.storage_account_network.default_action
      bypass                     = var.storage_account_network.bypass
      ip_rules                   = var.storage_account_network.ip_rules
      virtual_network_subnet_ids = var.storage_account_network.virtual_network_subnet_ids
    }
  }

  tags = var.tags
}
