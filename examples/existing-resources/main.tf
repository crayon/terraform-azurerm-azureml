terraform {
  required_version = ">=1.1.7"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=2.99.0"
    }
  }
}

provider "azurerm" {
  features {}
}


data "azurerm_resource_group" "azureml" {
  name = "rg-azureml-demo"
}

data "azurerm_application_insights" "azureml" {
  name                = "apin-azureml-demo"
  resource_group_name = data.azurerm_resource_group.azureml.name
}

data "azurerm_container_registry" "azureml" {
  name                = "acrazuremldemo"
  resource_group_name = data.azurerm_resource_group.azureml.name
}

data "azurerm_key_vault" "azureml" {
  name                = "kv-azureml-demo"
  resource_group_name = data.azurerm_resource_group.azureml.name
}

data "azurerm_storage_account" "azureml" {
  name                = "saazurermldemo"
  resource_group_name = data.azurerm_resource_group.azureml.name
}

module "azureml" {
  source = "github.com/crayon/terraform-azurerm-azureml"

  name                = "azureml-demo"
  resource_group_name = data.azurerm_resource_group.azureml.name

  application_insights_create = false
  application_insights_existing = {
    name           = data.azurerm_application_insights.azureml.name
    resource_group = data.azurerm_resource_group.azureml.name
  }

  container_registry_create = false
  container_registry_existing = {
    name           = data.azurerm_container_registry.azureml.name
    resource_group = data.azurerm_resource_group.azureml.name
  }

  key_vault_create = false
  key_vault_existing = {
    name           = data.azurerm_key_vault.azureml.name
    resource_group = data.azurerm_resource_group.azureml.name
  }

  storage_account_create = false
  storage_account_existing = {
    name           = data.azurerm_storage_account.azureml.name
    resource_group = data.azurerm_resource_group.azureml.name
  }
}
