data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "example" {
  name                = var.kv_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = var.sku
  tenant_id           = var.tenant_id
  purge_protection_enabled    = var.purge_protection_enabled
  # public_network_access_enabled = var.public_network_access_enabled

  # network_acls {
  #                  default_action = var.network_acls_default_action
  #                  bypass = var.network_acls_bypass
  #                 }

  # access_policy {
  #   tenant_id = data.azurerm_client_config.current.tenant_id
  #   object_id = data.azurerm_client_config.current.object_id

  #   key_permissions = var.key_permissions
  # }

}

resource "azurerm_key_vault_access_policy" "example" {
  key_vault_id = azurerm_key_vault.example.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = data.azurerm_client_config.current.object_id

  key_permissions = var.key_permissions
}

resource "azurerm_key_vault_key" "example" {
  name         = var.key_name
  key_vault_id = azurerm_key_vault.example.id
  key_type     = var.key_type
  key_opts = var.key_opts
  expiration_date = var.expiration_date
}

resource "azurerm_disk_encryption_set" "example" {
  name                = var.encryption_set_name
  resource_group_name = var.resource_group_name
  location            = var.location

  identity {
    type = var.identity_type
  }
   
  key_vault_key_id = azurerm_key_vault_key.example.id
  
}