resource "azurerm_resource_group" "rgvnet01" {
  name =  local.Resource_Group_Name
  location = var.azure_location
  tags = var.tags
}