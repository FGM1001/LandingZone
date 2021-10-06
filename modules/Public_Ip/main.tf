

resource "azurerm_public_ip" "pip" {
    resource_group_name = var.ResourceGroupName
    name = local.Name
    location = var.azure_location
    sku = var.sku
    sku_tier = var.sku_tier
    allocation_method = var.allocation_method
    availability_zone = var.availability_zone
  
}