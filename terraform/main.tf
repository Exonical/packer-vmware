module "vm" {
  source           = "./modules/content-library-ovf-linux-cloud-init/"
  vsphere_server   = var.vsphere_server
  vsphere_username = var.vsphere_username
  vsphere_password = var.vsphere_password
  vsphere_insecure = var.vsphere_insecure
  # vSphere Settings

  vsphere_datacenter          = "Datacenter"
  vsphere_cluster             = "Management"
  vsphere_datastore           = "local-datastore"
  vsphere_folder              = "linux-templates"
  vsphere_network             = "Core"
  vsphere_content_library     = "local-content"
  vsphere_content_library_ovf = "linux-rocky-8.10-main"

  # Virtual Machines Settings
  vm_count                   = 2
  vm_name                    = "rocky-cloud-init"
  vm_cpus                    = 4
  vm_memory                  = 8192
  vm_disk_size               = 100
  vm_firmware                = "efi"
  vm_efi_secure_boot_enabled = true

  # Network Settings
  vm_ip_addresses = ["10.0.0.61", "10.0.0.62"] # Array of IP addresses
  vm_subnet       = "/22"                            # Single subnet value (CIDR)
  vm_gateway      = "10.0.0.1"                    # Single gateway address
  vm_nameservers  = ["10.0.0.5"]           # Array of nameservers
  vm_tags = {
    "test-category" = "terraform-tag01"
  }
}

module "postgresql" {
  source           = "./modules/content-library-ovf-linux-cloud-init/"
  vsphere_server   = var.vsphere_server
  vsphere_username = var.vsphere_username
  vsphere_password = var.vsphere_password
  vsphere_insecure = var.vsphere_insecure
  # vSphere Settings

  vsphere_datacenter          = "Datacenter"
  vsphere_cluster             = "Management"
  vsphere_datastore           = "local-datastore"
  vsphere_folder              = "linux-templates"
  vsphere_network             = "Core"
  vsphere_content_library     = "local-content"
  vsphere_content_library_ovf = "linux-rocky-8.10-main"

  # Virtual Machines Settings
  vm_count                   = 3
  vm_name                    = "postgresql"
  vm_cpus                    = 4
  vm_memory                  = 8192
  vm_disk_size               = 100
  vm_firmware                = "efi"
  vm_efi_secure_boot_enabled = true

  # Network Settings
  vm_ip_addresses = ["10.0.0.71", "10.0.0.72", "10.0.0.73"] # Array of IP addresses
  vm_subnet       = "/22"                            # Single subnet value (CIDR)
  vm_gateway      = "10.0.0.1"                    # Single gateway address
  vm_nameservers  = ["10.0.0.5"]           # Array of nameservers
  vm_tags = {
    "test-category" = "terraform-tag01"
  }
}

###############################
##### WEB SERVER MACHINES #####
###############################