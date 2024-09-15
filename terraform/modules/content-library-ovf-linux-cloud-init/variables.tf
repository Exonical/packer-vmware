##################################################################################
# VARIABLES
##################################################################################

# Credentials

variable "vsphere_server" {
  type = string
}

variable "vsphere_username" {
  type      = string
  sensitive = true
}

variable "vsphere_password" {
  type      = string
  sensitive = true
}

variable "vsphere_insecure" {
  type    = bool
  default = false
}

variable "vm_count" {
  description = "Number of VMs to create"
  type        = number
}

variable "vm_ip_addresses" {
  description = "List of IP addresses for each VM"
  type        = list(string)
}

variable "vm_subnet" {
  description = "Subnet (CIDR) for the VM"
  type        = string
}

variable "vm_gateway" {
  description = "Gateway for the VM"
  type        = string
}

variable "vm_nameservers" {
  description = "List of nameservers"
  type        = list(string)
}


# vSphere Settings

variable "vsphere_datacenter" {
  type = string
}

variable "vsphere_cluster" {
  type = string
}

variable "vsphere_datastore" {
  type = string
}

variable "vsphere_folder" {
  type = string
}

variable "vsphere_network" {
  type = string
}

variable "vsphere_content_library" {
  type = string
}

variable "vsphere_content_library_ovf" {
  type = string
}

# Virtual Machine Settings

variable "vm_name" {
  type = string
}

variable "vm_cpus" {
  type = number
}

variable "vm_memory" {
  type = number
}

variable "vm_disk_size" {
  type = number
}

variable "vm_firmware" {
  type = string
}

variable "vm_efi_secure_boot_enabled" {
  type = bool
}

variable "vm_tags" {
  type = map(string)
  default = {}
}
