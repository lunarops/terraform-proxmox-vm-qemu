variable "proxmox_api_url" {
  type        = string
  description = "The API URL for the Proxmox server."
}

variable "proxmox_api_token_id" {
  type        = string
  description = "API Token ID for authenticating to the Proxmox server."
}

variable "proxmox_api_token_secret" {
  type        = string
  description = "API Token Secret for authenticating to the Proxmox server."
  sensitive   = true
}

variable "virtual_machines" {
  type = map(object({
    name : string
    qemu_os : string
    description : string
    target_node : string
    vmid : number
    os_type : string
    full_clone : bool
    template : string
    memory : number
    socket : number
    cores : number
    cpu : string
    ssh_user : string
    ip_address : string
    gateway : string
    cloud_init_pass : string
    automatic_reboot : bool
    onboot : bool
    dns_servers : string
    searchdomain : string
    agent : bool
    scsihw : string
    bootdisk : string
    storage_dev : string
    disk_type : string
    storage : string
    network_bridge_type : string
    network_model : string
    mac_address : string
    network_firewall : bool
    network_tag : number
  }))
  default     = {}
  description = "Configuration for each virtual machine to be created."
}
