# Reserve next available IP from CIDR
resource "infoblox_ip_reservation" "ipam_reservation" {
  network_view = "default"
  vm_name      = var.vm_name
  ipv4_cidr    = var.cidr
  comment      = var.ipam_reservation_comment
}

data "vsphere_datacenter" "dc" {
  name = var.vsphere_datacenter
}

data "vsphere_datastore" "vm_datastore" {
  name          = var.vsphere_datastore
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_resource_pool" "pool" {
  name          = var.vsphere_resource_pool
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  name          = var.network_name
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_content_library" "library" {
  name = var.vsphere_content_library
}

data "vsphere_content_library_item" "template" {
  name       = var.vm_template
  type       = "ovf"
  library_id = data.vsphere_content_library.library.id
}

# Resource to deploy VM
resource "vsphere_virtual_machine" "cloned_vm" {
  name             = var.vm_name
  folder           = var.vm_path
  datastore_id     = data.vsphere_datastore.vm_datastore.id
  resource_pool_id = data.vsphere_resource_pool.pool.id

  num_cpus = var.vm_vcpus
  memory   = var.vm_memory

  firmware = var.vm_firmware

  # First disk with label sda
  disk {
    label       = var.vm_disk_label_sda
    size        = var.vm_disk_size_sda
    unit_number = 0
  }

  # Second disk with label sdb
  disk {
    label       = var.vm_disk_label_sdb
    size        = var.vm_disk_size_sdb
    unit_number = 1
  }

  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = var.vsphere_adapter_type
  }

  clone {
    template_uuid = data.vsphere_content_library_item.template.id
    customize {
      linux_options {
        host_name = var.vm_name
        domain    = var.domain
      }
      network_interface {
        ipv4_address = infoblox_ip_reservation.ipam_reservation.reserved_ipv4_addr
        ipv4_netmask = var.netmask
      }
      ipv4_gateway = var.gateway
    }
  }
}
