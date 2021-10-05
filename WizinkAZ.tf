
module "rgvnethubprod"{
    source = "./modules/resource_group"
    azure_location = "westeurope"

    # Variables for naming convention"
    company="wz"
    cloudprovider = "az"
    environment = "dev"
    region ="uewe"
    service = "nethub"
    instancia = "01"
    tags = {
        Country = "ES"
    }
}

module "vnet_prod_hub_01"{
    source = "./modules/vnet_virtual_network"
    ResourceGroupName = module.rgvnethubprod.name
    azure_location = "westeurope"
    # Settings for naming convention VNET PROD HUB 01
    company="wz"
    cloudprovider = "az"
    environment = "dev"
    region ="euwe"
    service = "nethub"
    instance = "01"

    # Settings for vnet and subnet configuration
    vnet_address_space = "10.173.0.0/16"
    vnet_subnet_name = "FirewallSubnet"
    vnet_subnet_address_space = ["10.173.0.64/26"]
    tags = {
        Country = "ES"
    }
}

module "subnet_prod_hub_01"{
    source = "./modules/vnet_subnet"
    ResourceGroupName = module.rgvnethubprod.name
    vnet_id = module.vnet_prod_hub_01.id
    vnet_name = module.vnet_prod_hub_01.name
    subnet_name = "GatewaySubnet"
    subnet_address_space = ["10.173.0.0/26"]

}

module "nsg" { 
    source      = "./modules/Network_Security_Group"
    resource_group_name = module.rgvnethubprod.name
    service     = "nethub"
    instance    = "01"
    subnetid    = module.subnet_prod_hub_01.id
    tags = {
        Country = "ES"
    }
}

module "nsr" {
    source                      = "./modules/Network_Security_Rule"
    name                        = "Internet_Access_Inbound"
    resource_group_name         = module.rgvnethubprod.name
    network_security_group_name = module.nsg.name
    priority                    = 1000
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "TCP"
    source_port_range           = "*"
    destination_port_range      = "1024"
    source_address_prefix       = "*"
    destination_address_prefix  = "10.171.12.1"

}

module Route_Table {
    source = "./modules/Route_Table"
    ResourceGroupName = module.rgvnethubprod.name
    disable_bgp = true
    service = "nethub" 
    instance = "01"

    tags = {
        Country = "ES"
    }

}