variable "ResourceGroupName" {
    type = string
    description = "NAme of the resource group where the vnet resource will be deployed"
}
variable "azure_location"{
    type = string
    description = "(Optional). Specifies the supported Azure location where the resource exists"
    default = "westeurope"
}

variable "tags"{
  type        = map(any)
  description = "(Optional) A mapping of tags which should be assigned to the resource."
  default     = {}
}

variable "company" {
    type        = string
    description = "Name of the company"
    default = "wz"
}

variable "cloudprovider"{
    type        = string
    description ="Cloud Provider"
    default     = "az"
    validation{
        condition = contains(["aw","az","gc","oc"], var.cloudprovider)
        error_message = "(Required) The provider specified must be one of the allowed values (aw, az, gc, oc)."
    }
}

variable "environment" {
  type              = string
  description       = "environment short name"
  default           = "dev"
  validation {
    condition       = contains(["dev", "pre", "prod", "int"], var.environment)
    error_message   = "(Required) The environment specified must be one of the allowed values (dev, pre, pro, int)."
  }
}

variable "region"{
    type            = string
    description     = "Azure region"
    default         = "euwe"
}

variable "service" {
    type            = string
    description     = "Service to which the resource belongs"
}

variable "instance" {
    type = string
    description = "Number of order of the resource or resource group"
}

variable "resource"{
    type            = string
    description     = "Allowed resource nomenclature"
    default         =  "pip"
    validation {
      condition     = contains(["nsg","exr","exg","vpng","vnet","nic","snet","rt","pip","fw","adf","stg","dl","adb","sqlser","sqldb","apn","azr","aml","kv","lga"], var.resource)
      error_message = "The allowed values for resource type are: nsg,exr,exg,vpng,vnet,nic,snet,rt,pip,fw,adf,stg,dl,adb,sqlser,sqldb,apn,azr,aml,kv,lga."
    }
}


# Variables del recursos PiP

variable "sku" {
    type = string
    description = "The SKU of the Public IP. Accepted values are Basic and Standard. Defaults to Basic."
    default = "Basic"
    validation {
      condition = contains(["Basic","Standard"],var.sku)
      error_message = "Accepted values are Basic and Standard."
    }
  
}

variable "sku_tier"{
    type = string 
    description = "The SKU Tier that should be used for the Public IP. Default to Regional"
    default = "Regional"
    validation {
      condition = contains(["Regional","Global"],var.sku_tier)
      error_message = "Accepted values are Regional or Global."
    }
}

variable "allocation_method" {
    type = string
    description = "Defines the allocation method for this IP address. Possible values are Static or Dynamic. Default value is Static"
    default = "Static"
    validation {
      condition = contains(["Static","Dynamic"],var.allocation_method)
      error_message = "Possible values are Static or Dynamic."
    }
}

variable "availability_zone" {
    type = string
    description = "The availability zone to allocate the Public IP in. "
    default = "Zone_Redundant"
    validation {
      condition = contains(["Zone-Redundant","1","2","3","No-Zone"],var.availability_zone)
      error_message = "Allowed values are Zone-Redundant, 1, 2, 3, No-Zone."
    }
}

variable "ip_version" {
    type = string
    description = "The IP Version to use, IPv6 or IPv4."
    default = "IPv4"
    validation {
      condition = contains(["IPv6","IPv4"],var.ip_version)
      error_message = "Allowed values are IPv4 or IPv6."
    }
}

# Variables Locales
locals {
    Name = "${upper(var.company)}-${upper(var.cloudprovider)}-${upper(var.environment)}-${upper(var.region)}-${upper(var.service)}-${upper(var.resource)}-${upper(var.instance)}"

}

