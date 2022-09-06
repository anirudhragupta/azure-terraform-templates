terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.21.1"
    }
  }
}

provider "azurerm" {
  # Configuration options
  # subscription_id = ""
  # tenant_id = ""
  # client_id = ""
  # client_secret = ""
  features {}
}

resource "azurerm_resource_group" "testrg" {
    name = "terraform_rg" //r
    location = "centralindia" //r

    tags = {
      "environment" = "learning"
    }
}

resource "azurerm_storage_account" "first_storageacc" {
  name = "stgplayacc100" //r
  resource_group_name = "terraform_rg" //r
  location = "central india" //r
  account_kind = "StorageV2"
  account_tier = "Standard" //r
  account_replication_type = "LRS" //r
  access_tier = "Hot"

  depends_on = [
    azurerm_resource_group.testrg
  ]
}

resource "azurerm_storage_container" "container01" {
  name = "container01" //r
  storage_account_name = "stgplayacc100" //r
  container_access_type = "private"

  depends_on = [
    azurerm_storage_account.first_storageacc
  ]
}

resource "azurerm_storage_blob" "temptxt" {
  name = "temp.txt" //r
  storage_account_name = azurerm_storage_account.first_storageacc.name //r
  storage_container_name = azurerm_storage_container.container01.name //r
  type = "Block" //r

  depends_on = [
    azurerm_storage_container.container01
  ]
}