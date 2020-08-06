data "aws_vpc" "efs" {
  tags {
    Name = var.vpc_name
  }
}

data "aws_subnet_ids" "efs" {
  vpc_id = data.aws_vpc.efs.id
  tags {
    EFS = "True"
  }
}

module "simple" {
  source = "../.."

  subnets = data.aws_subnet_ids.efs.ids
  vpc_id  = data.aws_vpc.efs.id
}
