resource "azurerm_container_registry" "acr" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.sku
  zone_redundancy_enabled = var.bool_true
  public_network_access_enabled = var.public_network_access_enabled
  data_endpoint_enabled = var.bool_true
  quarantine_policy_enabled = var.bool_true
  retention_policy_in_days = var.no_one

  georeplications {
    location                = var.georeplications_location
    zone_redundancy_enabled = var.bool_true
    tags                    = {}
 }
}

# Enable Defender for Container Registries (ACR image scanning)
# resource "azurerm_security_center_subscription_pricing" "container_registry" {
#   resource_type = var.resource_type
#   tier          = var.tier # ✅ Required to enable vulnerability scanning
# }
