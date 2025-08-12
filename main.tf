module "marketing_vm" {
  source    = "./modules/remote-vm"
  providers = { yandex = yandex }

  vm_name       = "marketing-vm"
  labels        = { project = "marketing" }

  # compute
  platform_id   = var.platform_id
  cores         = var.cores
  memory        = var.memory
  core_fraction = var.core_fraction
  disk_size     = var.disk_size
  preemptible   = var.preemptible

  # net/disk/meta
  subnet_id     = var.subnet_id
  nat           = var.nat
  image_id      = var.image_id

   cloud_init = templatefile("${path.module}/cloud-init.yml", {
  ssh_keys = [var.ssh_public_key]
})
}

module "analytics_vm" {
  source    = "./modules/remote-vm"
  providers = { yandex = yandex }

  vm_name       = "analytics-vm"
  labels        = { project = "analytics" }

  platform_id   = var.platform_id
  cores         = var.cores
  memory        = var.memory
  core_fraction = var.core_fraction
  disk_size     = var.disk_size
  preemptible   = var.preemptible

  subnet_id     = var.subnet_id
  nat           = var.nat
  image_id      = var.image_id

  cloud_init = templatefile("${path.module}/cloud-init.yml", {
  ssh_keys = [var.ssh_public_key]
})

}

module "vpc_dev" {
  source   = "./vpc"
  env_name = "develop"
  zone     = "ru-central1-a"
  cidr     = "10.0.1.0/24"
}

module "marketing_vm" {
  source    = "./modules/remote-vm"
  providers = { yandex = yandex }

  vm_name       = "marketing-vm"
  labels        = { project = "marketing" }

  platform_id   = var.platform_id
  cores         = var.cores
  memory        = var.memory
  core_fraction = var.core_fraction
  disk_size     = var.disk_size
  preemptible   = var.preemptible

  # важно: subnet_id теперь из модуля VPC
  subnet_id     = module.vpc_dev.subnet_id
  nat           = var.nat
  image_id      = var.image_id

  cloud_init = templatefile("${path.module}/cloud-init.yml", {
    ssh_keys = [var.ssh_public_key]
  })
}

module "analytics_vm" {
  source    = "./modules/remote-vm"
  providers = { yandex = yandex }

  vm_name       = "analytics-vm"
  labels        = { project = "analytics" }

  platform_id   = var.platform_id
  cores         = var.cores
  memory        = var.memory
  core_fraction = var.core_fraction
  disk_size     = var.disk_size
  preemptible   = var.preemptible

  subnet_id     = module.vpc_dev.subnet_id
  nat           = var.nat
  image_id      = var.image_id

  cloud_init = templatefile("${path.module}/cloud-init.yml", {
    ssh_keys = [var.ssh_public_key]
  })
}

# Удобный вывод (для скрина)
output "vpc_subnet_info" {
  value = module.vpc_dev.subnet
}