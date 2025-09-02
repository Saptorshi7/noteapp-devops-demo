terraform {
  backend "azurerm" {
    resource_group_name   = "terraform-state"
    storage_account_name  = "tfstate0911"
    container_name        = "tfstate"
    key                   = "noteapp.terraform.tfstate"
  }
}
