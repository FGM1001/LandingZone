resource "azurerm_resource_group" "rgvnet01" {
  name =  join("-",["RG",var.company,var.provider,var.environment,var.region,var.service,var.instancia])
  location = var.azure_location
  tags = var.tags

}