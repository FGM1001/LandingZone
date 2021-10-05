
variable "name" {
    type        = string
    description = "Name of the rule"
  
}
variable "resource_group_name" {
    type = string
    description = "Resource group where the resource will be deployed."
}

variable "network_security_group_name"{
    type = string
    description = "Name of the security group for the new rule"
}

variable "priority" {
    type        = number
    description = "Priority of the rule"
    validation{
        condition     = (var.priority > 100) && (var.priority < 4096)
        error_message = "The  value of priority must be between 100 and 4096."
    }
}

variable "direction" {
    type        =  string
    description = "Direction of the network traffic: inbound or outbound"
    validation {
      condition     = contains(["Outbound","Inbound"],var.direction)
      error_message = "The allowed values in direction are: Outbound and Inbound."
    }
}

variable "access" {
    type        =  string
    description = "Action to do with the network traffic"
    validation {
      condition     = contains(["Allow","Deny"],var.access)
      error_message = "The allowed values in access are: Allow and Deny."
    }
}

variable "protocol" {
    type        =  string
    description = "Protocols configured in athe rule"
    validation {
      condition     = contains(["Any","TCP","UDP","ICMP"],var.protocol)
      error_message = "The allowed values in protocol variable are: Any, TCP, UDP, ICMP."
    }
}

variable "source_port_range" {
    type = string
    description = "Number or port"
}

variable "destination_port_range" {
    type = string
    description = "Destination ports"
}

variable "source_address_prefix" {
    type = string
    description = "CIDR or Source IP range or * to match any ip"
}

variable "destination_address_prefix"{
    type = string
    description = "CIDR or destination IP range or * to match any IP"
}
