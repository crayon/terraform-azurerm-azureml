# Terraform module for deploying AzureML workspace

A module to deploy AzureML workspace with all required dependencies on Azure, including:
* Azure Application Insights
* Azure Container Registry
* Azure Key Vault
* Storage Account

Those dependencies can be preconfigured and used within module or can be deployed with this module.

## Requirements
| | |
|----------|-----------|
|Terraform | >= 1.1.7  |
| azurerm  | >= 2.99.0 |


## Example deployment
>Check out the [examples](examples/) folder for more.

```hcl
module "azureml" {
  source  = "github.com/crayon/terraform-azurerm-azureml"

  name                  = "azureml-example"
  resource_group        = "rg-azureml-demo"
}
```

This module is currently in development with missing features:
* Private network configuration
