output "vm_details" {
  value = {
    vm_name      = "${vsphere_virtual_machine.cloned_vm.name}"
    ipv4_address = "${vsphere_virtual_machine.cloned_vm.*.default_ip_address}"
  }
}
