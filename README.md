# Vault AppRole Terraform Configuration

This Terraform configuration optionally creates a Vault AppRole for an application and attaches a policy that grants read access to `secret/data/app-<cluster-name>/*`.

## Usage

Configure Vault authentication for the Terraform Vault provider in your environment, then set `auth_approle` to `true` to create the policy and role. For example:

```hcl
auth_approle = true
k8s_cluster_name = "production"
```

The role name will be `app-production`, and its policy name will be `app-production-policy`. AppRole auth must already be enabled at the configured mount path. The secret engine policy path assumes a KV v2 mount named `secret`.

Review the Secret ID TTL and use settings before deployment. Their defaults of `0` mean Secret IDs do not expire and have unlimited uses.

## Requirements

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >1.14 |
| <a name="requirement_vault"></a> [vault](#requirement\_vault) | ~>5.7 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_vault"></a> [vault](#provider\_vault) | ~>5.7 |

## Resources

| Name | Type |
|------|------|
| [vault_approle_auth_backend_role.app](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/approle_auth_backend_role) | resource |
| [vault_policy.app](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_approle_mount"></a> [approle\_mount](#input\_approle\_mount) | Vault auth mount path for AppRole. | `string` | `"approle"` | no |
| <a name="input_approle_secret_id_num_uses"></a> [approle\_secret\_id\_num\_uses](#input\_approle\_secret\_id\_num\_uses) | Maximum uses for an AppRole Secret ID; zero means unlimited. | `number` | `0` | no |
| <a name="input_approle_secret_id_ttl"></a> [approle\_secret\_id\_ttl](#input\_approle\_secret\_id\_ttl) | TTL for AppRole Secret IDs, in seconds; zero means no expiration. | `number` | `0` | no |
| <a name="input_approle_token_max_ttl"></a> [approle\_token\_max\_ttl](#input\_approle\_token\_max\_ttl) | Maximum TTL for tokens issued by the AppRole, in seconds. | `number` | `7200` | no |
| <a name="input_approle_token_ttl"></a> [approle\_token\_ttl](#input\_approle\_token\_ttl) | Initial TTL for tokens issued by the AppRole, in seconds. | `number` | `3600` | no |
| <a name="input_auth_approle"></a> [auth\_approle](#input\_auth\_approle) | Whether to configure the AppRole auth role and policy. | `bool` | `false` | no |
| <a name="input_k8s_cluster_name"></a> [k8s\_cluster\_name](#input\_k8s\_cluster\_name) | Cluster name used to identify the AppRole and scope its policy. | `string` | `"my-k8s-cluster"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
