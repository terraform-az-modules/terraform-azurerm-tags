##-----------------------------------------------------------------------------
## Outputs
##-----------------------------------------------------------------------------
output "id" {
  value       = local.id
  description = "Disambiguated ID."
}

output "name" {
  value       = local.name
  description = "Normalized name."
}

output "repository" {
  value       = local.repository
  description = "Terraform current module repo"
}

output "business_unit" {
  value       = local.business_unit
  description = "Normalized business_unit"
}

output "environment" {
  value       = local.environment
  description = "Normalized environment"
}

output "attributes" {
  value       = local.attributes
  description = "Normalized attributes."
}

output "tags" {
  value       = local.tags
  description = "Normalized Tag map."
}

output "label_order" {
  value       = local.label_order
  description = "Normalized order of labels."
}

output "deployment_mode" {
  value       = local.deployment_mode
  description = "Normalized deployment mode."
}
