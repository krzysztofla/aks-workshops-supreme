variable "resource_group_name" {
  description = "supreme-aks-rg"
  type        = string
}

variable "location" {
  description = "polandcentral"
  type        = string
}

variable "aks_cluster_name" {
  description = "supreme-aks-dev-cluster"
  type        = string
}

# Create the resource group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# Create the AKS cluster
resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_cluster_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = var.aks_cluster_name

  default_node_pool {
    name                = "default"
    node_count          = 1
    vm_size             = "Standard_B2s"
    type                = "VirtualMachineScaleSets"
    enable_auto_scaling = false
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin = "azure"
  }
}