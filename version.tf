# version.tf
terraform {

  required_version = ">= 0.13.0"

  required_providers {
    proxmox = {
      source  = "MaartendeKruijf/proxmox"
      version = "0.0.1"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "4.0.5"
    }
  }
}
