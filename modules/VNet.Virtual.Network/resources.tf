resource "azurerm_virtual_network" "AVDVNETSPK02"{
    name = var.vnet_name
    location = var.azure_location
    resource_group_name = azurerm_resource_group.RGAVDSPK02.name
    address_space = ["192.168.101.0/26"]
    depends_on = [
        azurerm_resource_group.RGAVDSPK02
  ]

  tags = {
    Customer = "ADIF"
  }

}