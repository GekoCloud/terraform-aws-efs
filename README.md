# terraform-aws-efs
Terraform module which creates EFS resources on AWS

## Terraform versions

Terraform 0.12

## Usage

```hcl
module "efs" {
  source = "github.com/GekoCloud/terraform-aws-efs"

  subnets = var.subnets
  vpc_id  = var.vpc_id
}
```

## Examples

* [Simple file system](examples/simple-efs)
* [Complete file system](examples/complete-efs)

## License

Apache 2 Licensed. See LICENSE for full details.