terraform {
  experiments = [module_variable_optional_attrs]
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.78.0"
    }
    http = {
      source  = "hashicorp/http"
      version = "~>2.1.0"
    }
  }
}
provider "azurerm" {
  features {}
  skip_provider_registration = true
}