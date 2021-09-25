
resource "azurerm_resource_group" "rgvnet01" {
  name = var.resource_group_name
  location = local.azure_location

  tags = {
    var.tags
  }  

}

resource "azurerm_virtual_network" "AVDVNETSPK02"{
    name = var.vnet_name
    location = var.azure_location
    resource_group_name = var.resource_group_name
    address_space = [var.vnet_address_space]
    depends_on = [
        azurerm_resource_group.rgvnet01
  ]
  tags = {
    var.tags
  }

}