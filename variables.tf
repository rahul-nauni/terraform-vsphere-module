# variable "vsphere_role" {}
variable "ipam_reservation_comment" {
  type = string
}

variable "vsphere_datacenter" {
  type = string
}

variable "vsphere_datastore" {
  type = string
}

variable "vsphere_resource_pool" {
  type = string
}

variable "vsphere_content_library" {
  type = string
}

variable "vsphere_adapter_type" {
  type = string
}

variable "vm_vcenter" {
  type = string
}

variable "vm_replication" {
  type    = bool
  default = false
}

variable "is_sap_vm" {
  type = bool
}

variable "os_version" {
  type = string
}

variable "vm_template" {
  type = string
}

variable "vm_firmware" {
  type = string
}

variable "vm_name" {
  type = string
}

variable "vm_vcpus" {
  type = number
}

variable "vm_memory" {
  type = number
}

variable "vm_path" {
  type = string
}

variable "vm_disk_label_sda" {
  type = string
}

variable "vm_disk_label_sdb" {
  type = string
}

variable "vm_disk_size_sda" {
  type = number
}

variable "vm_disk_size_sdb" {
  type = number
}

# variable "DNS_SERVER_IP_1" {}
# variable "DNS_SERVER_IP_2" {}

variable "domain" {
  type = string
}

variable "network_name" {
  type = string
}

variable "cidr" {
  type = string
}

variable "gateway" {
  type = string
}

variable "netmask" {
  type = number
}
