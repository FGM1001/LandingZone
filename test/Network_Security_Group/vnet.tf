
module "rgvnethubprod"{
    source = "../../modules/resource_group"
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
    source = "../../modules/vnet_virtual_network"
    ResourceGroupName = module.rgvnethubprod.Name
    azure_location = "westeurope"
    # Settings for naming convention VNET PROD HUB 01
    company="wz"
    cloudprovider = "az"
    environment = "prod"
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
    source = "../../modules/vnet_subnet"
    ResourceGroupName = module.rgvnethubprod.Name
    vnet_id = module.vnet_prod_hub_01.id
    vnet_name = module.vnet_prod_hub_01.name
    subnet_name = "GatewaySubnet"
    subnet_address_space = ["10.173.0.0/26"]

}