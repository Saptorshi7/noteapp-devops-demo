terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.41.0"
    }
  }

  # backend "azurerm" {
  #   resource_group_name   = "terraform-state"
  #   storage_account_name  = "tfstate0911"
  #   container_name        = "tfstate"
  #   key                   = "noteapp.terraform.tfstate"
  # }

}