
resource "azurerm_network_security_group" "nsg"{
    name=var.name
    location=var.azure_location
    resource_group_name = var.resource_group_name
}