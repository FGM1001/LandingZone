
module "ResourceGroup1"{
    source = "../../modules/Resource_Group"

    company="wz"
    provider = "az"
    environment = "des"
    region ="uewe"
    service = "nethub"
    instancia = "01"
    tags = {
        Country = "ES"
    }
}

module "ResourceGroup2"{
    source = "../modules/VNet.Network_SecurityGroup"

    company="wz"
    provider = "az"
    environment = "des"
    region ="uewe"
    service = "netspk"
    instancia = "01"
    tags = {
        Country = "ES"
    }
}

module "ResourceGroup3"{
    source = "./modules/Resource_Group"

    company="wz"
    provider = "az"
    environment = "des"
    region ="uewe"
    service = "netspk"
    instancia = "02"
    tags = {
        Country = "ES"
    }
}

module "VNET_VirtualNetwork_hub"{
    source = "./VNet.Network_SecurityGroup"

    # Settings for naming convention
    company="wz"
    provider = "az"
    environment = "des"
    region ="uewe"
    service = "netspk"
    instancia = "01"
    tags = {
        Country = "ES"
    }


}