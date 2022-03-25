# AzureML Workspace

This module is for creating and maintaining the lifecycle of an AzureML workspace, bringing together all the resources needed, from the workspace itself to application insights, container registry, key vault, networking and storage account.

So far it supports scenarios with deploying all dependencies or providing already existing resources that will be used within AzureML workspace.

Even though we set descriptions for all the input variables, there are logic in this module that we can't really describe in just a few words. This is why we are adding this supplemental documentation.

>This document is still a work in progress. If anything is unclear, feel free to add an issue to this repository. Some sections might be empty as a reminder to @crayon/terraform-maintainers to update it.

## Global variables

Currently following variables are supported:

| Name | Required | Type | Default | Description |
| ---- | -------- | ---- | ------- | ----------- |
| `name` | yes | string | - | Name used for all deployed resources |
| `resource_group_name` | yes | string | - | Resource group where resources will be deployed |
| `azureml_public_access` | no | bool | true | Enable public connectivity to AzureML workspace |
| `tags` | no | map | {} | List of tags used for all newly deployed resources |


## Application Insights

Currently following variables are supported for Application Insights instance:

| Name | Required | Type | Default | Description |
| ---- | -------- | ---- | ------- | ----------- |
| `application_insights_create` | no | bool | true | Flag to create new Application Insights |
| `application_insights_existing` | no | object | {name = null, resource_group = null} | Information about existing Application Insights instance (only if existing is being used) |
| `application_insights_log_analytics` | no | object | {name = null, resource_group = null} | Information about Log Analytics instance (if being used) |
| `application_insights_public_ingest` | no | bool | true | Enable public ingest of data to Application Insights |
| `application_insights_retention_days` | no | number | 90 | Retention period of data in Application Insights, can only be one of [30 60 90 120 180 270 365 550 730] |


## Azure Container Registry

Currently following variables are supported for Azure container registry:

| Name | Required | Type | Default | Description |
| ---- | -------- | ---- | ------- | ----------- |
| `container_registry_create` | no | bool | true | Flag to create new Azure Container Registry |
| `container_registry_existing` | no | object | {name = null, resource_group = null} | Information about existing Azure Container Registry (only if existing is being used) |
| `container_registry_sku` | no | string | Basic | SKU used for new Azure Container Registry, can only be one of "Basic", "Standard" or "Premium" |


## Key Vault

Currently following variables are supported for key vault:

| Name | Required | Type | Default | Description |
| ---- | -------- | ---- | ------- | ----------- |
| `key_vault_create` | no | bool | true | Flag to create new Key Vault |
| `key_vault_existing` | no | object | {name = null, resource_group = null} | Information about existing Key Vault (only if existing is being used) |
| `key_vault_sku` | no | string | standard | SKU used for new Key Vault, can only be one of "standard" or "premium" |


## Storage Account

Currently following variables are supported for storage account:

| Name | Required | Type | Default | Description |
| ---- | -------- | ---- | ------- | ----------- |
| `storage_account_create` | no | bool | true | Flag to create new Storage Account |
| `storage_account_existing` | no | object | {name = null, resource_group = null} | Information about existing Storage Account (only if existing is being used) |
| `storage_account_network` | no | object | null | Storage account network settings if new one is created |
| `storage_account_settings` | no | object | {kind = "StorageV2", replication_type = "LRS", tier = "Standard"} | Storage account settings if new one is created |

**Usage example:**

```hcl
module "azureml" {
  source  = "github.com/crayon/terraform-azurerm-azureml"

  name                  = "azureml-example"
  resource_group        = "rg-azureml-demo"
}
```
