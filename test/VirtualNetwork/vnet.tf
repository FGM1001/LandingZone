


module "ResourceGroup"{
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




module "VNET_VirtualNetwork_hub"{
    source = "../../modules/vnet_virtualnetwork"

    # Settings for naming convention
    company="wz"
    provider = "az"
    environment = "dev"
    region ="uewe"
    service = "nethub"
    instancia = "01"
    tags = {
        Country = "ES"
    }


}