  resource "yandex_vpc_network" "network-1" {
    name = "network-1"
  }
  resource "yandex_vpc_network" "network-2" {
    name = "network-2"
  }
  resource "yandex_vpc_subnet" "subnet-1" {
    name           = "subnet-1"
    zone           = "ru-central1-a"
    network_id     = "${yandex_vpc_network.network-1.id}"
    v4_cidr_blocks = ["192.168.10.0/24"]
  }

  resource "yandex_vpc_subnet" "subnet-2" {
    name           = "subnet-2"
    zone           = "ru-central1-a"
    network_id     = "${yandex_vpc_network.network-2.id}"
    v4_cidr_blocks = ["192.168.20.0/24"]
  }