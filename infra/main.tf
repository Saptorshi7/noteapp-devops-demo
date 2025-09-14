provider "azurerm" {
  features {}
  subscription_id = "a212de98-e4e5-43b3-99d4-2359ceb44aaf"
}

# Resource group
module "rg" {
  source              = "./modules/rg"

  name     = local.rg_name
  location = var.location
}

# Azure Kubernetes Service (AKS)
module "aks" {
  source              = "./modules/aks"

  name     = local.aks_name
  location = var.location
  resource_group_name     = local.rg_name
  dns_prefix          = var.project_name
  default_node_pool_name       = var.default_node_pool_name
  default_node_pool_node_count = var.no_one
  default_node_pool_vm_size    = var.default_node_pool_vm_size
  identity_type = var.identity_type

  depends_on = [module.rg]
}

# Azure Container Registry (ACR)
module "acr" {
  source              = "./modules/acr"

  name                = var.acr_name
  resource_group_name = local.rg_name
  location            = var.location
  sku                 = var.sku
  bool_true = var.bool_true
  # resource_type = var.resource_type
  # tier          = var.tier
  public_network_access_enabled = var.public_network_access_enabled
  georeplications_location = var.georeplications_location
  no_one = var.no_one

  depends_on = [module.rg]
}