# main.tf
# Generate RSA key pair for SSH access to virtual machines
resource "tls_private_key" "virtual_machine_keys" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create Proxmox virtual machines based on the provided configuration
resource "proxmox_vm_qemu" "virtual_machines" {
  depends_on = [
    tls_private_key.virtual_machine_keys
  ]

  # Iterate over each virtual machine configuration specified in var.virtual_machines
  for_each = var.virtual_machines

  # VM-specific settings
  name             = each.value.name
  qemu_os          = each.value.qemu_os
  desc             = each.value.description
  target_node      = each.value.target_node
  vmid             = each.value.vmid
  os_type          = each.value.os_type
  full_clone       = each.value.full_clone
  clone            = each.value.template
  memory           = each.value.memory
  sockets          = each.value.socket
  cores            = each.value.cores
  cpu              = each.value.cpu
  ssh_user         = each.value.ssh_user
  sshkeys          = tls_private_key.virtual_machine_keys.public_key_openssh
  ciuser           = each.value.ssh_user
  ipconfig0        = "ip=${each.value.ip_address}/32,gw=${each.value.gateway}"
  cipassword       = each.value.cloud_init_pass
  automatic_reboot = each.value.automatic_reboot
  onboot           = each.value.onboot
  nameserver       = each.value.dns_servers
  searchdomain     = each.value.searchdomain
  agent            = each.value.agent
  scsihw           = each.value.scsihw
  bootdisk         = each.value.bootdisk

  # Disk configuration for the virtual machine
  disk {
    storage = each.value.storage_dev
    type    = each.value.disk_type
    size    = each.value.storage
  }

  # Network configuration for the virtual machine
  network {
    bridge   = each.value.network_bridge_type
    model    = each.value.network_model
    mtu      = 0
    macaddr  = each.value.mac_address
    queues   = 0
    rate     = 0
    firewall = each.value.network_firewall
    tag      = each.value.network_tag
  }
}
