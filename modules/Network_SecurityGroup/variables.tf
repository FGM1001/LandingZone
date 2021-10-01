
variable "resource_group_name"{
    type = string
    description = "Name of the resource group"
}

variable "azure_location"{
    type = string
    description = "(Optional). Specifies the supported Azure location where the resource exists"
    default = "westeurope"
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
    default         =  "nsg"
    validation {
      condition     = contains(["nsg","exr","exg","vpng","vnet","nic","snet","rt","pip","fw","adf","stg","dl","adb","sqlser","sqldb","apn","azr","aml","kv","lga"], var.resource)
      error_message = "The allowed values for resource type are: nsg,exr,exg,vpng,vnet,nic,snet,rt,pip,fw,adf,stg,dl,adb,sqlser,sqldb,apn,azr,aml,kv,lga."
    }
}

#
# Locals Variables

locals {
    NSG_Name = "${upper(var.company)}-${upper(var.cloudprovider)}-${upper(var.environment)}-${upper(var.region)}-${upper(var.service)}-${upper(var.resource)}-${upper(var.instance)}"
}