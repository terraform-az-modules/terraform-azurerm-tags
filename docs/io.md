## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| attributes | Additional attributes (e.g. `1`). | `list(string)` | `[]` | no |
| business\_unit | Top-level division of your company that owns the subscription or workload that the resource belongs to. In smaller organizations, this tag might represent a single corporate or shared top-level organizational element. | `string` | `"Corp"` | no |
| delimiter | Delimiter to be used between `organization`, `name`, `environment` and `attributes`. | `string` | `"-"` | no |
| deployment\_mode | Specifies how the infrastructure/resource is deployed | `string` | `"terraform"` | no |
| enabled | Set to false to prevent the module from creating any resources. | `bool` | `true` | no |
| environment | Environment (e.g. `prod`, `dev`, `staging`). | `string` | `""` | no |
| extra\_tags | Additional tags (e.g. map(`BusinessUnit`,`XYZ`). | `map(string)` | `{}` | no |
| label\_order | The order of labels used to construct resource names or tags. If not specified, defaults to ['name', 'environment', 'location']. Example: ['webserver', 'qa', 'devops', 'public']. Valid values include keys from the context: 'name', 'environment', 'location', or any other relevant attribute. | `list(any)` | `[]` | no |
| location | Azure region (e.g. `eastus`, `westus`). | `string` | `""` | no |
| managedby | ManagedBy, eg 'terraform-az-modules'. | `string` | `"terraform-az-modules"` | no |
| name | Name  (e.g. `app` or `cluster`). | `string` | `""` | no |
| repository | Terraform current module repo | `string` | `"https://github.com/terraform-az-modules/terraform-azure-tags.git"` | no |

## Outputs

| Name | Description |
|------|-------------|
| attributes | Normalized attributes. |
| business\_unit | Normalized business\_unit |
| deployment\_mode | Normalized deployment mode. |
| environment | Normalized environment |
| id | Disambiguated ID. |
| label\_order | Normalized order of labels. |
| name | Normalized name. |
| repository | Terraform current module repo |
| tags | Normalized Tag map. |

