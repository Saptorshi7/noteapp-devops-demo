locals {
  key_vault_access_policies = {
    current_user = {
      object_id       = data.azurerm_client_config.current.object_id
      key_permissions = var.key_permissions
      depends_on      = []
    }
    des_identity = {
      object_id       = azurerm_disk_encryption_set.example.identity[0].principal_id
      key_permissions = var.azurerm_key_vault_access_policy_des_key_permissions
      depends_on      = [azurerm_disk_encryption_set.example]
    }
  }
}