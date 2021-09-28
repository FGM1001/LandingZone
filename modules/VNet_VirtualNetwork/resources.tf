
resource "azurerm_virtual_network" "vnet"{
    name = var.vnet_name
    location = var.azure_location
    resource_group_name = var.resource_group_name
    address_space = [var.vnet_address_space]
    tags = var.tags
}


resource "azurerm_subnet" "subnet" {
    name                 = join("-",[var.company,var.cloudprovider,var.environment,var.region,"net",var.resource])
    resource_group_name  = azurerm_resource_group.rgvnet01
    virtual_network_name = azurerm_virtual_network.vnet
    address_prefixes       = var.vnet_subnet_address_space
    depends_on = [
        azurerm_virtual_network.vnet
    ]

}