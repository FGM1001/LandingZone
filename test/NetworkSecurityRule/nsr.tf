
locals {
  ResourceGroupName = "RG-WZ-AZ-DEV-UEWE-NETHUB-01"
  NetworkSecurityGroupName = "WZ-AZ-DEV-EUWE-NETHUB-NSG-01"
}

module nsrtest{
    source                      = "../../modules/Network_Security_Rule"
    name                        = "Rule_Test"
    resource_group_name         = local.ResourceGroupName
    network_security_group_name = local.NetworkSecurityGroupName
    priority                    = 1000
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "TCP"
    source_port_range           = "*"
    destination_port_range      = "1024"
    source_address_prefix       = "*"
    destination_address_prefix  = "10.171.12.1"
}