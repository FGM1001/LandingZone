
data "azurerm_resource_group" "rm"{
    name = var.resource_group_name
}

data "azurerm_network_security_group" "nsg"{
    name = var.network_security_group_name
}

resource "azurer_network_security_rule" "nsr"{
    name = var.name
    priority = var.priority
    direction = var.direction
    access = var.access
    protocol = var.protocol
    source_port_range = var.source_port_range
    destination_port_range = var.destination_port_range
    source_address_prefix =  var.source_address_prefix
    destination_address_prefix = var.destination_address_prefix

    resource_group_name = data.azurerm_resource_group.rm.name
    network_security_group_name = data.azurerm_network_security_group.nsg.name
}