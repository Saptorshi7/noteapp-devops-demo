provider "azurerm" {
  features {}
  subscription_id = "7a5894f6-08c1-4be6-9647-7b66145ecd5d"
}

# Resource group
resource "azurerm_resource_group" "rg" {
  name     = "react-app-rg"
  location = "South India"
}

# Azure Kubernetes Service (AKS)
resource "azurerm_kubernetes_cluster" "aks" {
  name                = "react-app-aks"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "react-app"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D4ds_v5"
  }

  identity {
    type = "SystemAssigned"
  }
}

# Azure Container Registry (ACR)
resource "azurerm_container_registry" "acr" {
  name                = "reactappacr123"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Basic"
}