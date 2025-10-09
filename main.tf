##-----------------------------------------------------------------------------
## Labels - Designed to generate consistent label names and tags for resources. You can use terraform-labels to implement a strict naming convention.
##-----------------------------------------------------------------------------
locals {
  label_order_defaults = {
    label_order = ["name", "environment", "location"]
  }

  region_match = {
    "eastus"             = "eus"
    "eastus2"            = "eus2"
    "westus"             = "wus"
    "westus2"            = "wus2"
    "westus3"            = "wus3"
    "centralus"          = "cus"
    "northcentralus"     = "ncus"
    "southcentralus"     = "scus"
    "canadacentral"      = "cace"
    "canadaeast"         = "caes"
    "uksouth"            = "uks"
    "ukwest"             = "ukw"
    "westeurope"         = "weu"
    "northeurope"        = "neu"
    "southeastasia"      = "sea"
    "eastasia"           = "ea"
    "australiaeast"      = "aue"
    "australiasoutheast" = "ause"
    "australiacentral"   = "auc"
    "japaneast"          = "jpe"
    "japanwest"          = "jpw"
    "koreacentral"       = "korc"
    "koreasouth"         = "kors"
    "westindia"          = "inw"
    "southindia"         = "insi"
    "centralindia"       = "inci"
    "brazilsouth"        = "brs"
    "brazilsoutheast"    = "brse"
    "norwayeast"         = "noe"
    "norwaywest"         = "now"
  }

  best_match   = [for k, v in local.region_match : v if lower(k) == lower(var.location)]
  region_short = length(local.best_match) > 0 ? local.best_match[0] : var.location

  id_context = {
    name        = var.name
    environment = var.environment
    location    = local.region_short
  }

  label_order = length(var.label_order) > 0 ? var.label_order : local.label_order_defaults.label_order

  id_labels = [for l in local.label_order : local.id_context[l] if length(local.id_context[l]) > 0]
  id        = lower(join(var.delimiter, local.id_labels, var.attributes))

  name            = var.enabled == true ? lower(format("%v", var.name)) : ""
  environment     = var.enabled == true ? lower(format("%v", var.environment)) : ""
  managedby       = var.enabled == true ? lower(format("%v", var.managedby)) : ""
  repository      = var.enabled == true ? lower(format("%v", var.repository)) : ""
  business_unit   = var.enabled == true ? lower(format("%v", var.business_unit)) : ""
  deployment_mode = var.enabled == true ? lower(format("%v", var.deployment_mode)) : ""
  attributes      = var.enabled == true ? lower(format("%v", join(var.delimiter, compact(var.attributes)))) : ""

  tags_context = {
    name            = local.name
    environment     = local.environment
    managedby       = local.managedby
    repository      = local.repository
    business_unit   = local.business_unit
    deployment_mode = local.deployment_mode
  }

  generated_tags = {
    for l in keys(local.tags_context) : title(l) => local.tags_context[l] if length(local.tags_context[l]) > 0
  }

  tags = merge(local.generated_tags, var.extra_tags)
}
