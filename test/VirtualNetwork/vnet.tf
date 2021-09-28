


module "ResourceGroup1"{
    source = "../../modules/resource_group"

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
    source = "../../modules/resource_group"

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
    source = "../../modules/resource_group"

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
    source = "../../modules/vnet_virtualnetwork"

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