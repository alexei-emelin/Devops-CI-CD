terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"

  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "my-storage"
    region     = "ru-central1"
    key        = "[terraform.workspace]/terraform.tfstate"
    access_key = ""
    secret_key = ""

    skip_region_validation      = true
    skip_credentials_validation = true
  }
}

provider "yandex" {
  token = var.oauth_token
  cloud_id = var.yandex_cloud_id
  folder_id = var.yandex_folder_id
  zone = "ru-central1-a"
}
