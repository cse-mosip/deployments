
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.61.0"
    }
  }
}

provider "azurerm" {
  features {

  }
}
resource "azurerm_resource_group" "rg-aks-cluster" {
  name     = var.rgname
  location = var.location
}

resource "azurerm_kubernetes_cluster" "mosip-cluster" {
  name                =  var.cluster_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg-aks-cluster.name
  dns_prefix          = "k8s"

  default_node_pool {
    name            = var.node_pool_name
    node_count      = var.node_count
    vm_size         = var.node_vm_size
    os_disk_size_gb = 30
  }

identity {
        type = "SystemAssigned"
    }
  role_based_access_control_enabled = false

  tags = {
    environment = var.environment
  }
}
