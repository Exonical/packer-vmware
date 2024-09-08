<!--
Copyright 2023-2024 Broadcom. All rights reserved.
SPDX-License-Identifier: BSD-2
-->

<!-- markdownlint-disable first-line-h1 no-inline-html -->

<img src="docs/assets/images/icon-color.svg" alt="VMware vSphere" width="150">

# Packer Examples for VMware vSphere

![Last Commit](https://img.shields.io/github/last-commit/vmware-samples/packer-examples-for-vsphere?style=for-the-badge&logo=github)&nbsp;&nbsp;
[![Documentation](https://img.shields.io/badge/Documentation-Read-blue?style=for-the-badge&logo=readthedocs&logoColor=white)](https://vmware-samples.github.io/packer-examples-for-vsphere)

This repository provides a collection of opinionated examples that demonstrate how you can use both [HashiCorp Packer][packer] and the [Packer Plugin for VMware vSphere][packer-plugin-vsphere] (`vsphere-iso` builder) to automate the creation of virtual machine images for VMware vSphere environments.

Whether you're a developer, systems administrator, or site reliability engineer, this project is designed to both help and inspire you in streamlining your infrastructure provisioning process and maintain consistency in your virtualization workflow.

All examples are provided in the HashiCorp Configuration Language ("HCL").

This project supports the following guest operating systems:

## Linux Distributions

| Operating System             | Version   |
| :---                         | :---      |
| Rocky Linux                  | 9         |
| Rocky Linux                  | 8         |

## Microsoft Windows

| Operating System         | Version | Editions                    | Experience       |
| :---                     | :---    | :---                        | :---             |
| Microsoft Windows Server | 2025    | Standard and Datacenter     | Core and Desktop |
| Microsoft Windows Server | 2022    | Standard and Datacenter     | Core and Desktop |
| Microsoft Windows        | 11      | Professional and Enterprise | -                |

## Documentation

Please refer to the [documentation][documentation] for more detailed information about this project.

[//]: Links
[packer]: https://www.packer.io
[packer-plugin-vsphere]: https://developer.hashicorp.com/packer/plugins/builders/vsphere/vsphere-iso
