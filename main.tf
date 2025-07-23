provider "azurerm" {
  features {}
subscription_id = "983c9fca-e373-42ff-af2c-757425080aa1"
}

resource "azurerm_resource_group" "aks_rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = var.aks_cluster_name
  location            = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name
  dns_prefix          = "aksdemo"

default_node_pool {
  name       = "default"
  node_count = var.node_count
  vm_size    = "Standard_B2s"
}

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Demo"
  }
}
