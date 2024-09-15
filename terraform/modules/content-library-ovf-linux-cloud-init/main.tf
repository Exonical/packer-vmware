provider "vsphere" {
  vsphere_server       = var.vsphere_server
  user                 = var.vsphere_username
  password             = var.vsphere_password
  allow_unverified_ssl = var.vsphere_insecure
}

data "vsphere_datacenter" "datacenter" {
  name = var.vsphere_datacenter
}

data "vsphere_network" "network" {
  name          = var.vsphere_network
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_compute_cluster" "cluster" {
  name          = var.vsphere_cluster
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_resource_pool" "pool" {
  name          = format("%s%s", data.vsphere_compute_cluster.cluster.name, "/Resources")
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_datastore" "datastore" {
  name          = var.vsphere_datastore
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_content_library" "content_library" {
  name = var.vsphere_content_library
}

data "vsphere_content_library_item" "content_library_item" {
  name       = var.vsphere_content_library_ovf
  type       = "ovf"
  library_id = data.vsphere_content_library.content_library.id
}

# Query existing tag category
data "vsphere_tag_category" "category" {
  for_each = var.vm_tags
  name     = each.key
}

# Query existing tag
data "vsphere_tag" "tag" {
  for_each    = var.vm_tags
  name        = each.value
  category_id = data.vsphere_tag_category.category[each.key].id
}

# Create new tag category if it doesn't exist
resource "vsphere_tag_category" "category" {
  for_each = { for key, value in var.vm_tags : key => value if length(try(data.vsphere_tag_category.category[key].id, "")) == 0 }

  name        = each.key
  description = "Managed by Terraform"
  cardinality = "SINGLE"
  associable_types = ["VirtualMachine"]
}

# Create new tag if it doesn't exist
resource "vsphere_tag" "tag" {
  for_each = { for key, value in var.vm_tags : key => value if length(try(data.vsphere_tag.tag[key].id, "")) == 0 }

  name        = each.value
  category_id = vsphere_tag_category.category[each.key].id
}

resource "vsphere_virtual_machine" "vm" {
  count                   = var.vm_count                                   # Use vm_count to specify the number of VMs to create
  name                    = format("%s%02d", var.vm_name, count.index + 1) # Format the name with leading zeros
  folder                  = var.vsphere_folder
  num_cpus                = var.vm_cpus
  memory                  = var.vm_memory
  firmware                = var.vm_firmware
  efi_secure_boot_enabled = var.vm_efi_secure_boot_enabled
  datastore_id            = data.vsphere_datastore.datastore.id
  resource_pool_id        = data.vsphere_resource_pool.pool.id
  network_interface {
    network_id = data.vsphere_network.network.id
  }
  disk {
    label            = "disk0"
    size             = var.vm_disk_size
    thin_provisioned = true
  }
  clone {
    template_uuid = data.vsphere_content_library_item.content_library_item.id
  }
  lifecycle {
    ignore_changes = [
      clone[0].template_uuid,
    ]
    create_before_destroy = true  # Ensure recreation if tag changes
  }
  extra_config = {
    "guestinfo.metadata"          = base64encode(templatefile("${path.module}/metadata.yml", {
      instance_id  = format("%s%02d", var.vm_name, count.index + 1),
      hostname     = format("%s%02d", var.vm_name, count.index + 1),
      ip_address   = var.vm_ip_addresses[count.index],
      subnet       = var.vm_subnet,
      gateway      = var.vm_gateway,
      nameservers  = var.vm_nameservers
    }))
    "guestinfo.metadata.encoding" = "base64"
    "guestinfo.userdata"          = base64encode(file("${path.module}/userdata.yml"))
    "guestinfo.userdata.encoding" = "base64"
  }

  # Apply tags (just reference the existing tag IDs)
  tags = flatten([
    for key, value in var.vm_tags :
    try(data.vsphere_tag.tag[key].id, vsphere_tag.tag[key].id)
  ])
}
