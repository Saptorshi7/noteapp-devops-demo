resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix

  default_node_pool {
    name       = var.default_node_pool_name
    node_count = var.default_node_pool_node_count
    vm_size    = var.default_node_pool_vm_size
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
  
}