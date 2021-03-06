


resource "azurerm_virtual_network" "vnet"{
    name = local.VNET_Name
    location = var.azure_location
    resource_group_name  = var.ResourceGroupName
    address_space = [var.vnet_address_space]
    tags = var.tags
}


resource "azurerm_subnet" "subnet" {
    resource_group_name  = azurerm_virtual_network.vnet.resource_group_name
    name                 = var.vnet_subnet_name
    virtual_network_name = azurerm_virtual_network.vnet.name
    address_prefixes     = var.vnet_subnet_address_space
    depends_on = [
        azurerm_virtual_network.vnet
    ]

}