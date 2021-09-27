
module "ResourceGroup"{
    source = "../modules/Resource.Group"

    company="wz"
    provider = "az"
    environment = "des"
    region ="uewe"
    service = "nethub"
    instancia = "01"
    tag = {
        Country = "ES"
    }
}

module "ResourceGroup"{
    source = "../modules/Resource.Group"

    company="wz"
    provider = "az"
    environment = "des"
    region ="uewe"
    service = "netspk"
    instancia = "01"
    tag = {
        Country = "ES"
    }
}

module "Resource_Group"{
    source = "../modules/Resource.Group"

    company="wz"
    provider = "az"
    environment = "des"
    region ="uewe"
    service = "netspk"
    instancia = "02"
    tag = {
        Country = "ES"
    }
}

module "VNET_VirtualNetwork"{
    source = "../modules/VNET_VirtualNetwork"

    # Settings for naming convention
    company="wz"
    provider = "az"
    environment = "des"
    region ="uewe"
    service = "netspk"
    instancia = "01"
        tag = {
        Country = "ES"
    }


}