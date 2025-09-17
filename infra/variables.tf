variable "location" {
    type = string
    default = "Central India"
}

variable "georeplications_location" {
    type = string
    default = "Southeast Asia"
}

variable "project_name" {
    type = string
    default = "react-app"
}

variable "default_node_pool_name" {
    type = string
    default = "default"
}

variable "default_node_pool_vm_size" {
    type = string
    default = "Standard_D4ds_v4"
}

variable "identity_type" {
    type = string
    default = "SystemAssigned"
}

variable "acr_name" {
    type = string
    default = "reactappacr47"
}

variable "sku" {
    type = string
    default = "Premium"
}

variable "bool_true" {
    type = string
    default = "true"
}

variable "public_network_access_enabled" {
    type = string
    default = "false"
}

variable "network_profile_network_policy" {
    type = string
    default = "azure"
}

variable "automatic_upgrade_channel" {
    type = string
    default = "stable"
}

variable "aks_sku" {
    type = string
    default = "Standard"
}

variable "default_node_pool_os_disk_type" {
    type = string
    default = "Ephemeral"
}

variable "workspace_sku" {
    type = string
    default = "PerGB2018"
}

variable "key_type" {
    type = string
    default = "RSA-HSM"
}

variable "tenant_id" {
    type = string
    default = "ebd2885c-4d89-4edb-bcfa-53f290653bea"
}

variable "network_acls_default_action" {
    type = string
    default = "Deny"
}

variable "network_acls_bypass" {
    type = string
    default = "AzureServices"
}

variable "expiration_date" {
    type = string
    default = "2025-12-30T20:00:00Z"
}

variable "kv_sku" {
    type = string
    default = "premium"
}

variable "subscription_id" {
    type = string
    default = "a212de98-e4e5-43b3-99d4-2359ceb44aaf"
}

variable "azurerm_version" {
    type = string
    default = "=4.41.0"
}

variable "no_one" {
    type = number
    default = 1
}

variable "max_pods" {
    type = number
    default = 50
}

variable "workspace_retention_in_days" {
    type = number
    default = 30
}

variable "key_size" {
    type = number
    default = 2048
}

variable "key_opts" {
    type = list(string)
    default = [
    "decrypt",
    "encrypt",
    "sign",
    "unwrapKey",
    "verify",
    "wrapKey"
  ]
}

variable "key_permissions" {
    type = list(string)
    default = ["List", "Create", "Delete", "Get", "Purge", "Recover", "Update", "GetRotationPolicy", "SetRotationPolicy"]
}

variable "azurerm_key_vault_access_policy_des_key_permissions" {
    type = list(string)
    default = [
    "Get",
    "WrapKey",
    "UnwrapKey"
  ]
}

locals {
  rg_name = "${var.project_name}-rg"
  aks_name = "${var.project_name}-aks"
  workspace_name = "${var.project_name}-workspace"
  kv_name = "${var.project_name}-kv"
  key_name = "${var.project_name}-key"
  encryption_set_name = "${var.project_name}-encryption_set"
}