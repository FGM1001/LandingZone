
locals {
  ResourceGroupName = "RG-WZ-AZ-DEV-UEWE-NETHUB-01"
  SubnetID = "/subscriptions/e1c70718-13f0-4a17-87a5-bc2e6a52d624/resourceGroups/RG-WZ-AZ-DEV-UEWE-NETHUB-01/providers/Microsoft.Network/virtualNetworks/WZ-AZ-PROD-EUWE-NETHUB-01/subnets/sn-prod-mgmt-01" 
}

module nsgtest{
    source      = "../../modules/Network_Security_Group"
    resource_group_name = local.ResourceGroupName
    service     = "nethub"
    instance    = "01"
    subnetid    = local.SubnetID

    tags = {
        Country = "ES"
    }
    
}