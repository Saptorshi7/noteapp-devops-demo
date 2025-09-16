resource "azurerm_key_vault" "example" {
  name                = var.kv_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = var.sku
}

resource "azurerm_key_vault_key" "example" {
  name         = var.key_name
  key_vault_id = azurerm_key_vault.example.id
  value        = var.azurerm_key_vault_key_value
}

resource "azurerm_disk_encryption_set" "example" {
  name                = var.encryption_set_name
  resource_group_name = var.resource_group_name
  location            = var.location

  identity {
    type = var.identity_type
  }

  encryption_specification {
    key_vault_key_id = azurerm_key_vault_key.example.id
  }
}