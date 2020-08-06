variable "encrypted" {
  description = "If true, the file system will be encrypted"
  type        = bool
  default     = false
}

variable "kms_key_id" {
  description = "If set, the ARN for the KMS encryption key. When specifying `kms_key_id`, `encrypted` needs to be set to true."
  type        = string
  default     = null
}

variable "mount_target_ip_address" {
  description = "The address (within the address range of the specified subnet) at which the file system may be mounted via the mount target"
  type        = string
  default     = ""
}

variable "performance_mode" {
  description = "The file system performance mode. Can be either `generalPurpose` or `maxIO`"
  type        = string
  default     = "generalPurpose"
}

variable "provisioned_throughput_in_mibps" {
  description = "The throughput, measured in MiB/s, that you want to provision for the file system. Only applicable with `throughput_mode` set to `provisioned`"
  default     = 0
}

variable "security_groups" {
  description = "Security group IDs to allow access to the EFS"
  type        = list(string)
}

variable "subnets" {
  description = "Subnet IDs"
  type        = list(string)
}

variable "tags" {
  description = "A map of tags to add to all resources."
  type        = map(string)
  default     = {}
}

variable "throughput_mode" {
  description = "Throughput mode for the file system. Defaults to bursting. Valid values: `bursting`, `provisioned`. When using `provisioned`, also set `provisioned_throughput_in_mibps`"
  type        = string
  default     = "bursting"
}

variable "transition_to_ia" {
  description = "Indicates how long it takes to transition files to the IA storage class. Valid values: AFTER_7_DAYS, AFTER_14_DAYS, AFTER_30_DAYS, AFTER_60_DAYS and AFTER_90_DAYS"
  type        = string
  default     = ""
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}
