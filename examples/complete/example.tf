
provider "azurerm" {
  features {}
}

##-----------------------------------------------------------------------------
## Labels module call.
##-----------------------------------------------------------------------------
module "labels" {
  source        = "./../.."
  name          = "labels"
  environment   = "test"
  location      = "northeurope"
  label_order   = ["name", "environment", "location"]
  managedby     = "terraform-az-modules"
  business_unit = "Corp"
  attributes    = ["private"]
  extra_tags = {
    Application = "test-app"
  }
}
