variable "rgname"{
    default = "rg-aks"
    type = string
}

variable "location"{
    default = "eastus2"
    type = string
}

variable "cluster_name"{
    type = string
}

variable "node_pool_name"{
    type = string
}

variable "node_count"{
    type = number
}

variable "node_vm_size"{
    type = string
}

variable "node_osdisk_size"{
    type = number
}

variable "environment"{
    type = string
}




