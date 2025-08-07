resource "yandex_compute_instance" "vm" {
  name        = var.vm_name
  platform_id = "standard-v1"
  zone        = "ru-central1-a"

  resources {
    cores         = 2
    memory        = 2
    core_fraction = 20
  }

  boot_disk {
    initialize_params {
      image_id = "fd8e4gcflhhc7odvbuss"
      size     = 10
    }
  }

  network_interface {
    subnet_id = "e2lkt1lfs7c45oih7au2"
    nat       = true
  }

  metadata = {
    user-data = var.cloud_init
  }

  labels = var.labels
}