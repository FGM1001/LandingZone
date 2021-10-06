

resource "azurerm_route_table" "atr"{
    name = local.Name
    location = var.azure_location
    resource_group_name = var.ResourceGroupName
    disable_bgp_route_propagation = var.disable_bgp

    route {
        name = "DefaultGW"
        address_prefix = "0.0.0.0/0"
        next_hop_type = "VirtualAppliance"
        next_hop_in_ip_address = "10.173.0.5"
    }  
}


