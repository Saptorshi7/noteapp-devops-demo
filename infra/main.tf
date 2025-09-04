provider "azurerm" {
  features {}
  subscription_id = "a212de98-e4e5-43b3-99d4-2359ceb44aaf"
}

# Resource group
module "rg" {
  source              = "./modules/rg"

  name     = var.rg_name
  location = var.location
}

# Azure Kubernetes Service (AKS)
resource "azurerm_kubernetes_cluster" "aks" {
  name                = "react-app-aks"
  location            = var.location
  resource_group_name = var.rg_name
  dns_prefix          = "react-app"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D4ds_v5"
  }

  identity {
    type = "SystemAssigned"
  }

  depends_on = [module.rg]

}

# Azure Container Registry (ACR)
resource "azurerm_container_registry" "acr" {
  name                = "reactappacr47"
  resource_group_name = var.rg_name
  location            = var.location
  sku                 = "Basic"
}
