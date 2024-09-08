# Copyright 2023-2024 Broadcom. All rights reserved.
# SPDX-License-Identifier: BSD-2

/*
    DESCRIPTION:
    Network variables used for all builds.
    - Variables are passed to and used by guest operating system configuration files (e.g., ks.cfg).

*/

// VM Network Settings (default DHCP)
vm_ip_address = "10.100.0.201"
vm_ip_netmask = 22
vm_ip_gateway = "10.100.0.1"
vm_dns_list   = [ "10.100.0.5" ]
