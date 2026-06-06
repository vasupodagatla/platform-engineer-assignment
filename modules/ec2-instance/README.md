# EC2 Instance Module

A reusable Terraform module designed to provision and standardise the deployment of EC2 instances across your environments.

---

## Features

* **Environment Validation:** Built-in validation limits deployments strictly to `dev`, `staging`, or `prod`.
* **Automated Tagging:** Applies a standard tagging strategy across all resources, including setting the `ManagedBy` tag to `Terraform`.

---

## Inputs

| Name | Description | Type | Default | Required |
| :--- | :--- | :--- | :---: | :---: |
| `instance_type` | EC2 instance type to provision. | `string` | — | **Yes** |
| `ami_id` | The AMI ID used to launch the instance. | `string` | — | **Yes** |
| `environment` | Deployment environment (`dev`, `staging`, `prod`). | `string` | — | **Yes** |
| `name` | Name of the EC2 instance. | `string` | — | **Yes** |

## Outputs

| Name | Description |
| :--- | :--- |
| `instance_id` | The unique identifier (ID) of the provisioned EC2 instance. |
| `private_ip` | The private IP address assigned to the EC2 instance. |

---

## Example Usage

```hcl
module "app_server" {
  source = "./modules/ec2-instance"

  name          = "app-server"
  environment   = "dev"
  instance_type = "t3.medium"
  ami_id        = "ami-0123456789abcdef0"
}

## Notes

- Environment validation restricts values to dev, staging, or prod.
- Standard tags are applied to all instances.
- ManagedBy tag is set to Terraform.