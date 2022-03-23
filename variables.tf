variable "name" {
  description = "Name used for the deployment. All resources prefixed based on the Azure naming convention."
  type        = string
  validation {
    condition = alltrue([
      length(var.name) >= 2,
      length(var.name) <= 22
    ])
    error_message = "Specified name must be between 2 and 22 characters long."
  }
}

variable "resource_group_name" {
  description = "The resource group you want to deploy to."
  type        = string
}

variable "application_insights_create" {
  description = "Flag to create new Application Insights instance."
  type        = bool
  default     = true
}

variable "application_insights_existing" {
  description = "(Optional) Existing Application Insights instance to be used (only if `application_insights_create = false`)."
  type = object({
    name           = string
    resource_group = string
  })
  default = {
    name           = null
    resource_group = null
  }
}

variable "application_insights_log_analytics" {
  description = "(Optional) Existing Log Analytics workspace to be used (only if `application_insights_create = true`)."
  type = object({
    name           = string
    resource_group = string
  })
  default = {
    name           = null
    resource_group = null
  }
}

variable "application_insights_public_ingest" {
  description = "(Optional) Enable public ingest of data to Application Insights instance (only if `application_insights_create = false`)."
  type        = bool
  default     = true
}

variable "application_insights_retention_days" {
  description = "(Optional) Number of days to keep data in Application Insights instance (only if `application_insights_create = false`)."
  type        = number
  default     = 90
  validation {
    condition     = can(regex("30|60|90|120|180|270|365|550|730", var.application_insights_retention_days))
    error_message = "Retention days can only be one of [30 60 90 120 180 270 365 550 730]."
  }
}

variable "azureml_public_access" {
  description = "(Optional) Enable connectivity to AzureML workspace from public internet."
  type        = bool
  default     = true
}

variable "container_registry_create" {
  description = "Flag to create new Container registry."
  type        = bool
  default     = true
}

variable "container_registry_existing" {
  description = "(Optional) Existing Container registry instance to be used (only if `container_registry_create = false`)."
  type = object({
    name           = string
    resource_group = string
  })
  default = {
    name           = null
    resource_group = null
  }
}

variable "container_registry_sku" {
  description = "SKU for Container registry instance (only if `container_registry_create = true`)."
  type        = string
  default     = "Basic"
  validation {
    condition     = can(regex("Basic|Standard|Premium", var.container_registry_sku))
    error_message = "Container registry SKU can only be `Basic`, `Standard` or `Premium`."
  }
}

variable "key_vault_create" {
  description = "Flag to create new Key Vault."
  type        = bool
  default     = true
}

variable "key_vault_existing" {
  description = "(Optional) Existing Key Vault to be used (only if `key_vault_create = false`)."
  type = object({
    name           = string
    resource_group = string
  })
  default = {
    name           = null
    resource_group = null
  }
}

variable "key_vault_sku" {
  description = "SKU for Key Vault (only if `key_vault_create = true`)"
  type        = string
  default     = "standard"
  validation {
    condition     = can(regex("standard|premium", var.key_vault_sku))
    error_message = "Container registry SKU can only be `standard` or `premium`."
  }
}

variable "storage_account_create" {
  description = "Flag to create new storage account."
  type        = bool
  default     = true
}

variable "storage_account_existing" {
  description = "(Optional) Existing storage account to be used (only if `storage_account_create = false`)."
  type = object({
    name           = string
    resource_group = string
  })
  default = {
    name           = null
    resource_group = null
  }
}

variable "storage_account_network" {
  description = "(Optional) Storage account network settings (only if `storage_account_create = true`)."
  type = object({
    default_action             = string
    bypass                     = list(string)
    ip_rules                   = list(string)
    virtual_network_subnet_ids = list(string)
  })
  default = null
}

variable "storage_account_settings" {
  description = "(Optional) Storage account settings (only if `storage_account_create = true`)."
  type = object({
    kind             = string
    replication_type = string
    tier             = string
  })
  default = {
    kind             = "StorageV2"
    replication_type = "LRS"
    tier             = "Standard"
  }
}

variable "tags" {
  description = "Tags used for all resources in the module."
  type        = map(string)
  default     = {}
}
