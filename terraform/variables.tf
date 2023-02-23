# Заменить на ID своего облака
# https://console.cloud.yandex.ru/cloud?section=overview
variable "yandex_cloud_id" {
  default = "b1gr2q81itvdrca4nu30"
}

# Заменить на Folder своего облака
# https://console.cloud.yandex.ru/cloud?section=overview
variable "yandex_folder_id" {
  default = "b1g259gr1ck7ejh9jd55"
}

# Заменить на ID своего образа
# ID можно узнать с помощью команды yc compute image list
variable "ubuntu" {
  default = "fd80d7fnvf399b1c207j"
}

variable "gitlab" {
  default = "fd8hu5b4b7156ntbt6rj"
}

# Указываем токен аутентификации
variable "oauth_token" {
  type = string
  default = ""
}
