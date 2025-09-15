variable "location" {
    type = string
    default = "South India"
}

variable "georeplications_location" {
    type = string
    default = "North India"
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
    default = "workspaceResourceId"
}

variable "automatic_upgrade_channel" {
    type = string
    default = "stable"
}

variable "api_server_access_profile_authorized_ip_ranges" {
    type = string
    default = "192.168.0.0/16"
}

variable "max_pods" {
    type = number
    default = 50
}

variable "disk_encryption_set_id" {
    type = string
    default = "someId"
}

variable "aks_sku" {
    type = string
    default = "Standard"
}

locals {
  rg_name = "${var.project_name}-rg"
  aks_name = "${var.project_name}-aks"
}