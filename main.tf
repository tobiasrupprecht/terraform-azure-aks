terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.66.0"
    }
  }
  required_version = ">=0.14.9"
}

provider "azurerm" {
  features {}
}

# Deploy Resource Group
resource "azurerm_resource_group" "default" {
  name     = "${var.prefix_name}-${var.name}-rg"
  location = var.location

  tags = {
    environment = var.environment
  }
}

# Deploy Kubernetes Cluster (AKS)
resource "azurerm_kubernetes_cluster" "default" {
  name                = "${var.prefix_name}-${var.name}"
  location            = azurerm_resource_group.default.location
  resource_group_name = azurerm_resource_group.default.name
  dns_prefix          = "${var.prefix_name}-${var.name}-k8s"
  role_based_access_control_enabled = true

  default_node_pool {
    name            = "default"
    node_count      = 2
    vm_size         = "Standard_D2_v2"
    os_disk_size_gb = 30
  }

    service_principal {
    client_id     = var.appId
    client_secret = var.password
  }

#  role_based_access_control_enabled {
#    enabled = true
#  }

  tags = {
    environment = var.environment
  }
}
