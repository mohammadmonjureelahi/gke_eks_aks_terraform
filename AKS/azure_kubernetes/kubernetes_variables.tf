variable client_id {}
variable client_secret {}
variable ssh_public_key {}

variable environment {
    default = "dev"
}

variable location {
    default = "westeurope"
}

variable node_count {
  default = 2
}



variable dns_prefix {
  default = "k8stest"
}

variable cluster_name {
  default = "k8stest"
}

variable resource_group {
  
}
/*variable "storage_account" {}
variable "access_key_id" {}
variable "container_named" {}
variable "backend_key" {} */

/*variable "agent_pools" {
  description = "(Optional) List of agent_pools profile for multiple node pools"
  type = list(object({
    name                = string
    count               = number
    vm_size             = string
    os_type             = string
    os_disk_size_gb     = number
    max_pods            = number
    availability_zones  = list(number)
    enable_auto_scaling = bool
    min_count           = number
    max_count           = number
  }))
  
  default = [{
    name                = "pool1"
    count               = 1
    vm_size             = "Standard_DS1_v2"
    os_type             = "Linux"
    os_disk_size_gb     = 30
    max_pods            = 30
    availability_zones  = [1, 2, 3]
    enable_auto_scaling = true
    min_count           = 1
    max_count           = 3
  },
  ]
} */



