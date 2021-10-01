# Required Variables fot VNET   

# Global variables to use with the resources

variable "ResourceGroupName" {
    type = string
    description = "Nsme of the resource group where the vnet resource will be deployed"
}

variable "vnet_name"{
    type = string
    description = "Name of the VNET where create the Subnet"
}

variable "vnet_id" {
    type = string
    description = "Vnet id "
  
}

variable "subnet_name" {
    type            = string
    description     = "(Required) Subnet Name."
}

 variable "subnet_address_space"{
     type           = list(string)
     description    = "CIDR address space for the subnet"
     default        = ["10.10.0.0/24"]
 }

# Variables para crear el nombre de la VNET


    