
module "ResourceGroup1"{
    source = "https://github.com/FGM1001/LandingZone/tree/master/modules/Resource_Group"

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
    source = "https://github.com/FGM1001/LandingZone/tree/master/modules/Resource_Group"

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
    source = "https://github.com/FGM1001/LandingZone/tree/master/modules/Resource_Group"

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
    source = "https://github.com/FGM1001/LandingZone/tree/master/modules/VNet_VirtualNetwork"

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