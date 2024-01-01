# output.tf
# output "master_ipv4_addresses" {
#   value = {
#     for instance in proxmox_vm_qemu.master :
#     instance.name => instance.default_ipv4_address
#   }
# }

# output "worker_ipv4_addresses" {
#   value = {
#     for instance in proxmox_vm_qemu.worker :
#     instance.name => instance.default_ipv4_address
#   }
# }

output "virtual_machine_private_key" {
  value     = tls_private_key.virtual_machine_keys.private_key_pem
  sensitive = true
}
