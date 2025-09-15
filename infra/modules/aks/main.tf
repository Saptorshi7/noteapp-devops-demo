resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix
  automatic_upgrade_channel = var.automatic_upgrade_channel
  local_account_disabled = var.bool_true
  disk_encryption_set_id = var.disk_encryption_set_id
  azure_policy_enabled = var.bool_true
  private_cluster_enabled = var.bool_true
  sku_tier = var.aks_sku

  default_node_pool {
    name       = var.default_node_pool_name
    node_count = var.default_node_pool_node_count
    vm_size    = var.default_node_pool_vm_size
    max_pods   = var.default_node_pool_max_pods
    host_encryption_enabled = var.bool_true
    os_disk_type = var.default_node_pool_os_disk_type
    only_critical_addons_enabled =var.bool_true
  }

  identity {
    type = var.identity_type
  }

   network_profile {
    network_plugin=var.network_profile_network_policy
    network_policy=var.network_profile_network_policy
   }

    oms_agent {
      log_analytics_workspace_id = var.oms_agent_log_analytics_workspace_id
    }
  
  api_server_access_profile {
    authorized_ip_ranges = var.api_server_access_profile_authorized_ip_ranges
  }

  key_vault_secrets_provider {
    secret_rotation_enabled = var.bool_true
  }
  
}