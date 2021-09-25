# Required Variables fot VNET   

# Global variables to use with the resources
variable "resource_group_name"{
    type = string
    description = "The name of the resource group where create the resources."
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

variable "provider"{
    type        = string
    description ="Cloud Provider"
    default     = "az"
    validation{
        condition = contains(["aw","az","gc","oc"], var.environment)
        error_message = "(Required) The provider specified must be one of the allowed values (aw, az, gc, oc)."
    }
}

variable "environment" {
  type          = string
  description   = "environment short name"
  default       = "dev"
  validation {
    condition     = contains(["dev", "pre", "pro", "int"], var.environment)
    error_message = "(Required) The environment specified must be one of the allowed values (dev, pre, pro, int)."
  }
}

variable "region"{
    type        = string
    description = "Azure region"
    default     = "euwe"
}

variable "services" {
    type        = string
    description = "Service to which the resource belongs"
}

variable "resource"{
    type        = string
    description = "Allowed resource nomenclature"
    default     =  "vnet"
    validation {
      condition = contains (["nsg","exr","exg","vpng","vnet","nic","snet","rt","pip","fw","adf","stg","dl","adb","sqlser","sqldb","apn","azr","aml","kv","lga"],var.resource)
      error_message = "The allowed values for resource type are: nsg,exr,exg,vpng,vnet,nic,snet,rt,pip,fw,adf,stg,dl,adb,sqlser,sqldb,apn,azr,aml,kv,lga "
    }
}

#Varialbe for VNET resource

variable "vnet_name"{
    type        =string
    description = "Name of the vnet resource"
    default     = join("-",[var.company,var.provider,var.environment,var.region,"net",var.resource])
}

variable "vnet_address_space"{
    type=string
     description = "CIDR address space for the subnet"
     default = "10.10.0.0/16"
}

 variable "vnet_subnet"{
     type=string
     description = "CIDR address space for the subnet"
     default = "10.10.0.0/24"
 }
