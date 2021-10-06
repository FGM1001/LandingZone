

resource "azurerm_resource_group" "rg" {
  name =  local.Resource_Group_Name
  location = var.azure_location
  tags = var.tags
}