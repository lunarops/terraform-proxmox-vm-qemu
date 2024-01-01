# variables.tf
variable "proxmox_api_url" {
  type = string
}

variable "proxmox_api_token_id" {
  type = string
}

variable "proxmox_api_token_secret" {
  type = string
}

variable "virtual_machines" {
  type        = map(any)
  default     = {}
  description = "Identifies the object of virtual machines."
}
