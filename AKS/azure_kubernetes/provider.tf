provider "azurerm" {
  version = "=2.0.0"
  features {}
}


terraform {
  backend "azurerm" {
    storage_account_name=""
    access_key="" 
    key="" 
    container_name="" 
  }
} 
