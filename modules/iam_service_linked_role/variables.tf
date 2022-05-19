##########################################################################
### REQUIRED
##########################################################################
variable "aws_service_name" {
  description = "The AWS service to which this role is attached"
  type        = string
}

##########################################################################
### OPTIONAL
##########################################################################
variable "custom_suffix" {
  default     = null
  description = "Additional string appended to the role name"
  type        = string
}
variable "description" {
  default     = null
  description = "The description of the role"
  type        = string
}

variable "tags" {
  default     = {}
  description = "Key-value mapping of tags for the IAM role"
  type        = map(string)
}
