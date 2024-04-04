terraform {
  backend "azurerm" {
    resource_group_name  = "cloud-labs-dev"
    storage_account_name = "tfstatestorage0"
    container_name       = "akstfstate"
    key                  = "dev.aks.terraform.tfstate"
  }
}