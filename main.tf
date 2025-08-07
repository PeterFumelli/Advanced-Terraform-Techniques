terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "~> 1.12.0"
    }
  }
}

provider "yandex" {
  token     = var.token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.default_zone
}

module "marketing_vm" {
  source     = "./modules/remote-vm"
  vm_name    = "marketing-vm"
  labels     = { project = "marketing" }
  cloud_init = templatefile("${path.module}/cloud-init.yml", {
    ssh_keys = [var.ssh_public_key]
  })
}

module "analytics_vm" {
  source     = "./modules/remote-vm"
  vm_name    = "analytics-vm"
  labels     = { project = "analytics" }
  cloud_init = templatefile("${path.module}/cloud-init.yml", {
    ssh_keys = [var.ssh_public_key]
  })
}