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
  network_profile_network_policy = var.network_profile_network_policy
  oms_agent_log_analytics_workspace_id = module.monitoring.log_analytics_workspace_id
  automatic_upgrade_channel = var.automatic_upgrade_channel
  api_server_access_profile_authorized_ip_ranges = var.api_server_access_profile_authorized_ip_ranges
  default_node_pool_max_pods = var.max_pods
  bool_true = var.bool_true
  disk_encryption_set_id = module.security.disk_encryption_set_id
  aks_sku = var.aks_sku
  default_node_pool_os_disk_type = var.default_node_pool_os_disk_type

  depends_on = [module.rg, module.monitoring]
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

module "monitoring" {
  source              = "./modules/monitoring"

  name     = local.workspace_name
  location = var.location
  resource_group_name = local.rg_name
  sku = var.workspace_sku
  retention_in_days = var.workspace_retention_in_days

  depends_on = [module.rg]
}

module "security" {
  source              = "./modules/security"

  kv_name     = local.kv_name
  key_name     = local.key_name
  encryption_set_name     = local.encryption_set_name
  location = var.location
  resource_group_name = local.rg_name
  sku = var.kv_sku
  identity_type = var.identity_type
  key_opts = var.key_opts
  key_type = var.key_type
  tenant_id = var.tenant_id
  purge_protection_enabled = var.bool_true
  network_acls_default_action = var.network_acls_default_action
  network_acls_bypass = var.network_acls_bypass
  public_network_access_enabled = var.public_network_access_enabled
  expiration_date = var.expiration_date

  depends_on = [module.rg]
}