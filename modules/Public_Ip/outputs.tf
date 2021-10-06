output "id" {
    value = azurerm_public_ip.pip.id
}

output "name" {
  value = local.Name
}

output "publicip" {
    value =  azurerm_public_ip.pip.ip_address
}