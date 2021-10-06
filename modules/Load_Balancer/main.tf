resource "azurerm_lb" "ilb" {
    name = local.name
    location = var.azure_location
    resource_group_name = var.ResourceGroupName
    frontend_ip_configuration {
        name = var.Public_IP_Name
        public_ip_address_id = var.Public_IP_ID
    }    
  
}