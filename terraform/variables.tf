variable "vsphere_server" {
  description = "vSphere server address"
  type        = string
}

variable "vsphere_username" {
  description = "vSphere username"
  type        = string
}

variable "vsphere_password" {
  description = "vSphere password"
  type        = string
  sensitive   = true
}

variable "vsphere_insecure" {
  description = "Whether to skip SSL verification"
  type        = bool
  default     = false
}