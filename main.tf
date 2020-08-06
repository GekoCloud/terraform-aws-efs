resource "aws_efs_file_system" "this" {
  encrypted                       = var.encrypted
  kms_key_id                      = var.kms_key_id
  performance_mode                = var.performance_mode
  provisioned_throughput_in_mibps = var.provisioned_throughput_in_mibps
  throughput_mode                 = var.throughput_mode

  dynamic "lifecycle_policy" {
    for_each = var.transition_to_ia == "" ? [] : [1]
    content {
      transition_to_ia = var.transition_to_ia
    }
  }
}

resource "aws_security_group" "this" {
  description = "EFS Security Group for ${aws_efs_file_system.this.id}"
  tags        = var.tags
  vpc_id      = var.vpc_id

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group_rule" "ingress" {
  count                    = length(var.security_groups)

  from_port                = "2049" # NFS
  protocol                 = "tcp"
  security_group_id        = aws_security_group.this.id
  source_security_group_id = var.security_groups[count.index]
  to_port                  = "2049"
  type                     = "ingress"
}

resource "aws_security_group_rule" "egress" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 0
  protocol          = "-1"
  security_group_id = aws_security_group.this.id
  to_port           = 0
  type              = "egress"
}

resource "aws_efs_mount_target" "this" {
  count           = length(var.subnets)
  file_system_id  = aws_efs_file_system.this.id
  ip_address      = var.mount_target_ip_address
  subnet_id       = var.subnets[count.index]
  security_groups = [ aws_security_group.this.id ]
}
