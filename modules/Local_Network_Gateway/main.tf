
resource "azurerm_local_network_gateway" "lng" {
    name                = local.name
    resource_group_name = var.ResourceGroupName
    location            = var.azure_location
    gateway_address     = var.gateway_address
}