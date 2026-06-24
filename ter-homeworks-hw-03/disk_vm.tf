resource "yandex_compute_disk" "disks" {
  count = 3
  name  = "vdisk-${count.index + 1}"
  type  = "network-hdd"
  zone  = var.default_zone
  size  = 1
}

resource "yandex_compute_instance" "storage" {
  name        = "storage"
  hostname    = "storage"
  platform_id = var.common_platform
  zone        = var.default_zone

  resources {
    cores         = 2
    memory        = 1
    core_fraction = 20
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }

  dynamic "secondary_disk" {
    for_each = yandex_compute_disk.disks[*].id
    content {
      disk_id = secondary_disk.value
    }
  }

  scheduling_policy {
    preemptible = var.preempt_on
  }

  network_interface {
  subnet_id          = yandex_vpc_subnet.develop.id
  nat                = false
  security_group_ids = [yandex_vpc_security_group.example.id]
}

  metadata = local.metadata
}