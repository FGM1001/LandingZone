resource "azurerm_resource_group" "rgvnet01" {
  name = var.resource_group_name
  location = var.azure_location
  tags = var.tags

}