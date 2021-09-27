
module "ResourceGroup"{
    source = "../modules/Resource.Group"
    resource_group_name = join("-",["RG",var.company,var.provider,var.environment,var.region,"nethub",var.resource,"01"])
    tag = {
        Country = "ES"
    }

}
module "VNET.Virtual.Network"{
    source = "../modules/VNET.Virtual.Network"

        services = "net"
    vnet_name = join("-",[var.company,var.provider,var.environment,var.region,"nethub",var.resource,"01"])
    vnet_subnet_name = "Subnet01"
    vnet_address_space = "10.1.0.0/16"
    vnet_subnet_address_space = "10.1.1.0/24"

    tag = {

    }

}