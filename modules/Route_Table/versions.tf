terraform {
  experiments = [module_variable_optional_attrs]
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.79.0"
    }
  }
}
provider "azurerm" {
  features {}
  skip_provider_registration = true
}