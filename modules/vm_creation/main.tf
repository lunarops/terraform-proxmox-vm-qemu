resource "proxmox_vm_qemu" "virtual_machines" {
  for_each = var.virtual_machines

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
  sshkeys          = var.ssh_public_key
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

  dynamic "disk" {
    for_each = [each.value]
    content {
      storage = disk.value.storage_dev
      type    = disk.value.disk_type
      size    = disk.value.storage
    }
  }

  dynamic "network" {
    for_each = [each.value]
    content {
      bridge   = network.value.network_bridge_type
      model    = network.value.network_model
      macaddr  = network.value.mac_address
      firewall = network.value.network_firewall
      tag      = network.value.network_tag
    }
  }
}
