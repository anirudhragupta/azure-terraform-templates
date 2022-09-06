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
  name = "terraform_rg"
  location = "central india"
}

resource "azurerm_virtual_network" "vnet01" {
  name = "vnet01"
  location = "central india"
  resource_group_name = "terraform_rg"
  address_space = ["10.0.0.0/16", "10.1.0.0/16"]

  subnet {
    name = "sub01"
    address_prefix = "10.0.0.0/24"
  }

  subnet {
    name = "sub02"
    address_prefix = "10.0.1.0/24"
  }

  tags = {
    "environment" = "learning"
  }

  depends_on = [
    azurerm_resource_group.testrg
  ]
}

resource "azurerm_subnet" "testsubnet" {
  name = "testsubnet"
  resource_group_name = "terraform_rg"
  virtual_network_name = "vnet01"
  address_prefixes = ["10.1.1.0/24"]

  depends_on = [
    azurerm_virtual_network.vnet01
  ]
}