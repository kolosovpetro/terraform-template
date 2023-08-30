# terraform-template

## Pre-commit configuration

- Install python3 via windows store
- `pip install --upgrade pip`
- `pip install pre-commit`
- Update PATH variable

## Install terraform docs

- `choco install terraform-docs`

## Install tflint

- `choco install tflint`

## Documentation

- https://github.com/antonbabenko/pre-commit-terraform
- https://github.com/terraform-docs/terraform-docs
- https://terraform-docs.io/user-guide/installation/
- https://pre-commit.com/

## Storage account configuration file

```bash
storage_account_name = "storage_account_name"
container_name       = "container_name"
key                  = "terraform.tfstate"
sas_token            = "sas_token"
```

## Deploy storage account for terraform state

- See [CreateAzureStorageAccount.ps1](./CreateAzureStorageAccount.ps1)

# Module documentation

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Requirements

No requirements.

## Providers

| Name                                                          | Version |
|---------------------------------------------------------------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.71.0  |

## Modules

| Name                                                                             | Source                      | Version |
|----------------------------------------------------------------------------------|-----------------------------|---------|
| <a name="module_resource_group"></a> [resource\_group](#module\_resource\_group) | ./modules/example_submodule | n/a     |

## Resources

| Name                                                                                                                              | Type        |
|-----------------------------------------------------------------------------------------------------------------------------------|-------------|
| [azurerm_resource_group.public](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group)   | resource    |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name                                                                                                        | Description              | Type     | Default | Required |
|-------------------------------------------------------------------------------------------------------------|--------------------------|----------|---------|:--------:|
| <a name="input_prefix"></a> [prefix](#input\_prefix)                                                        | Prefix for all resources | `string` | n/a     |   yes    |
| <a name="input_resource_group_location"></a> [resource\_group\_location](#input\_resource\_group\_location) | Resource group location  | `string` | n/a     |   yes    |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name)             | Resource group name      | `string` | n/a     |   yes    |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
