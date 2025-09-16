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

variable "no_one" {
    type = number
    default = 1
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

# variable "resource_type" {
#     type = string
#     default = "ContainerRegistry"
# }

# variable "tier" {
#     type = string
#     default = "Standard"
# }

variable "public_network_access_enabled" {
    type = string
    default = "false"
}

variable "network_profile_network_policy" {
    type = string
    default = "azure"
}

variable "oms_agent_log_analytics_workspace_id" {
    type = string
    default = "/subscriptions/11111111-2222-3333-4444-555555555555/resourceGroups/my-rg/providers/Microsoft.OperationalInsights/workspaces/my-workspace"
}

variable "automatic_upgrade_channel" {
    type = string
    default = "stable"
}

variable "api_server_access_profile_authorized_ip_ranges" {
     type    = list(string)
  default = ["192.168.0.0/16"] # ✅ list of strings
}

variable "max_pods" {
    type = number
    default = 50
}

variable "disk_encryption_set_id" {
    type = string
    default = "/subscriptions/11111111-2222-3333-4444-555555555555/resourceGroups/my-rg/providers/Microsoft.Compute/diskEncryptionSets/my-des"
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

variable "workspace_retention_in_days" {
    type = number
    default = 30
}

variable "key_type" {
    type = string
    default = "RSA-HSM"
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

variable "tenant_id" {
    type = string
    default = "ebd2885c-4d89-4edb-bcfa-53f290653bea"
}

variable "network_acls_default_action" {
    type = string
    default = "Allow"
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
    default = "standard"
}

locals {
  rg_name = "${var.project_name}-rg"
  aks_name = "${var.project_name}-aks"
  workspace_name = "${var.project_name}-workspace"
  kv_name = "${var.project_name}-kv"
  key_name = "${var.project_name}-key"
  encryption_set_name = "${var.project_name}-encryption_set"
}