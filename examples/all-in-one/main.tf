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

module "azureml" {
  source = "github.com/crayon/terraform-azurerm-azureml"

  name = "azureml-demo"
  resource_group_name = "rg-azureml-demo"
}
