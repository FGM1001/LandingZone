output "id" {
    value =  azurerm_network_security_group.nsg.id
}

output "name"{
    value = azurerm_network_security_group.nsg.resource_group_name
}