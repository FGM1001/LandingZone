# Required Variables fot VNET   

# Global variables to use with the resources

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
    default         =  "lb"
    validation {
      condition     = contains(["nsg","exr","exg","vpng","vnet","nic","snet","rt","pip","fw","adf","stg","dl","adb","sqlser","sqldb","apn","azr","aml","kv","lga","lng","ilb"], var.resource)
      error_message = "The allowed values for resource type are: nsg,exr,exg,vpng,vnet,nic,snet,rt,pip,fw,adf,stg,dl,adb,sqlser,sqldb,apn,azr,aml,kv,lga."
    }
}

#
# Variables del recurso Load Balancer

variable "Public_IP_Name" {
    type =  string
    description = "Name of the public IP"
}

variable "Public_IP_ID" {
    type = string
    description = "ID of the Public IP used in the ILB"
}

#
# Variables locales

locals {
    name = "${upper(var.company)}-${upper(var.cloudprovider)}-${upper(var.environment)}-${upper(var.region)}-${upper(var.service)}-${upper(var.resource)}-${upper(var.instance)}"

}