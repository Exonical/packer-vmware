# Copyright 2023-2024 Broadcom. All rights reserved.
# SPDX-License-Identifier: BSD-2

/*
    DESCRIPTION:
    VMware vSphere variables used for all builds.
    - Variables are use by the source blocks.
*/

// vSphere Credentials
vsphere_endpoint            = "vcenter.example.com"
vsphere_username            = "Administrator@vsphere.local"
vsphere_password            = "VMw@re123!"
vsphere_insecure_connection = true

// vSphere Settings
vsphere_datacenter                     = "Datacenter"
//vsphere_cluster                        = "Management"
vsphere_host                         = "10.100.0.18"
vsphere_datastore                      = "local-datastore"
vsphere_network                        = "Core"
vsphere_folder                         = "linux-templates"
//vsphere_resource_pool                = "sfo-w01-rp01"
vsphere_set_host_for_datastore_uploads = false
