output "virtual_machine_details" {
  value = {
    for vm_id, vm in proxmox_vm_qemu.virtual_machines : vm_id => {
      "Name" : vm.name,
      "IP Address" : vm.ipconfig0,
      "Node" : vm.target_node,
      "VM ID" : vm.vmid,
      "SSH User" : vm.ssh_user,
      "Description" : vm.desc
    }
  }
  description = "Details of each virtual machine created, including name, IP address, node, VM ID, SSH user, and description."
}

output "virtual_machine_private_key" {
  value       = tls_private_key.virtual_machine_keys.private_key_pem
  sensitive   = true
  description = "The private SSH key for accessing the virtual machines. This key is sensitive and should be handled securely."
}

output "virtual_machine_public_key" {
  value       = tls_private_key.virtual_machine_keys.public_key_openssh
  description = "The public SSH key for the virtual machines."
}
