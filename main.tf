terraform {
  required_version = ">= 1.1.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
    cloudinit = {
      source  = "hashicorp/cloudinit"
      version = "2.3.3"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "cloudinit" {}

resource "azurerm_resource_group" "main" {
  name     = "${var.labelPrefix}-A05-RG"
  location = var.region
}
resource "azurerm_public_ip" "web" {
  name                = "${var.labelPrefix}-A05-pip"
  location            = var.region
  resource_group_name = azurerm_resource_group.main.name
  allocation_method   = "Dynamic"
}
