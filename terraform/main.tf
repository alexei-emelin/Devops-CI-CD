resource "yandex_compute_instance" "cp1" {
  name = "cp1"

  resources {
    cores  = 2
    memory = 4
  }
  allow_stopping_for_update = true
  boot_disk {
    initialize_params {
      image_id = var.ubuntu
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}

resource "yandex_compute_instance" "node1" {
  name = "node1"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = var.ubuntu
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}

resource "yandex_compute_instance" "node2" {
  name = "node2"
#  allow_stopping_for_update = true

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = var.ubuntu
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}

resource "yandex_compute_instance" "gitlab" {
  name = "gitlab"

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = var.gitlab
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
  }

  metadata = {
    ssh-keys = "gitlab:${file("~/.ssh/id_rsa.pub")}"
  }
}

#resource "yandex_iam_service_account" "sa" {
#  name = "sa"
#  folder_id = var.yandex_folder_id
#}
#
#//назначение роли сервисному аккаунту
#resource "yandex_resourcemanager_folder_iam_member" "sa-editor" {
#  folder_id = var.yandex_folder_id
#  member    = "serviceAccount:${yandex_iam_service_account.sa.id}"
#  role      = "editor"
#}
#
#//Создание статического ключа доступа
#resource "yandex_iam_service_account_static_access_key" "sa-static-key" {
#  service_account_id = yandex_iam_service_account.sa.id
#  description = "static access key for object storage"
#}
#
#//Создание бакета с использованием ключа
#resource "yandex_storage_bucket" "diplom-storage" {
#  access_key = yandex_iam_service_account_static_access_key.sa-static-key.access_key
#  secret_key = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
#  bucket = "diplom-storage"
#}

#locals {
#  yandex_instance_name_map = {
#    stage = "vm-1"
#    prod = "vm-2"
#  }
#}
#
#//Пример count
#
#locals {
#  vm_instance_count_map = {
#    stage = 1
#    prod  = 2
#  }
#}
#
#resource "yandex_compute_instance" "vm" {
#  name = local.yandex_instance_name_map[terraform.workspace]
#
#  count = local.vm_instance_count_map[terraform.workspace]
#
#  resources {
#    cores  = 2
#    memory = 2
#  }
#
#  boot_disk {
#    initialize_params {
#      image_id = "fd86cpunl4kkspv0u25a"
#    }
#  }
#
#  network_interface {
#    subnet_id = "${yandex_vpc_subnet.default.id}"
#    nat       = true
#  }
#
#  metadata = {
#    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
#  }
#}
#
##//Пример for_each
##
##locals {
##  instances = {
##    "standard-v1" = local.yandex_instance_name_map[terraform.workspace]
##  }
##}
##
##resource "yandex_compute_instance" "vm_for_each" {
##
##  for_each = local.instances
##
##  name = each.value
##
##  platform_id = each.key
##
##  lifecycle {
##    create_before_destroy = true
##  }
##
##  resources {
##    cores  = 2
##    memory = 2
##  }
##
##  boot_disk {
##    initialize_params {
##      image_id = "fd86cpunl4kkspv0u25a"
##    }
##  }
##
##  network_interface {
##    subnet_id = "${yandex_vpc_subnet.default.id}"
##    nat       = true
##  }
##
##  metadata = {
##    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
##  }
##}
#
#
