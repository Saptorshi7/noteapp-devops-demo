variable "location" {
    type = string
    default = "South India"
}

variable "project_name" {
    type = string
    default = "react-app"
}

variable "rg_name" {
    type = string
    default = "${var.project_name}-rg"
}

variable "aks_name" {
    type = string
    default = "${var.project_name}-aks"
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