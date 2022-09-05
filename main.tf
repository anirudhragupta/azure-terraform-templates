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
  subscription_id = "7c492b51-9b31-4cee-a661-c53899cdc68d"
  tenant_id = "e079b1e3-d30d-412d-9f38-0c1f1b2be790"
  client_id = "e190b5cf-a1de-4810-bb8a-e6e35ac1b355"
  client_secret = "BLo8Q~z0wCk4.RzNcOJhKjHO2Wallchp~wv~dcq0"
  features {}
}

resource "azurerm_resource_group" "testrg" {
    name = "test-rg"
    location = "Central India"
}