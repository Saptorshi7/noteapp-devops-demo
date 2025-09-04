variable "location" {
    type = string
    default = "South India"
}

variable "project_name" {
    type = string
    default = "react-app"
}

variable "default_node_pool_name" {
    type = string
    default = "default"
}

variable "default_node_pool_node_count" {
    type = number
    default = 1
}

variable "default_node_pool_vm_size" {
    type = string
    default = "Standard_D4ds_v5"
}

variable "identity_type" {
    type = string
    default = "SystemAssigned"
}

locals {
  rg_name = "${var.project_name}-rg"
  aks_name = "${var.project_name}-aks"
}