provider "azurerm" {
  features {}
}

module "tags" {
  source = "../../"
}
