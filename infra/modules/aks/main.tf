resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix
  automatic_upgrade_channel = var.automatic_upgrade_channel
  disk_encryption_set_id = var.disk_encryption_set_id
  azure_policy_enabled = var.bool_true
  # private_cluster_enabled = var.bool_true
  sku_tier = var.aks_sku

  default_node_pool {
    name       = var.default_node_pool_name
    node_count = var.default_node_pool_node_count
    vm_size    = var.default_node_pool_vm_size
    max_pods   = var.default_node_pool_max_pods
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
    
  key_vault_secrets_provider {
    secret_rotation_enabled = var.bool_true
  }
  
}

resource "azurerm_kubernetes_cluster_node_pool" "mem" {
 kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id
 name                  = "mem"
 node_count            = "1"
 vm_size               = "standard_d11_v2"
}