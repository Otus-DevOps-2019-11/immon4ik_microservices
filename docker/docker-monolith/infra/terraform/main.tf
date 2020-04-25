terraform {
  # Версия terraform
  required_version = "~>0.12.8"
}

provider "google" {
  # Версия провайдера
  version = "~>2.15"
  project = var.project
  region  = var.region
}

# Основное ресурса инстанса.
resource "google_compute_instance" "app" {
  count        = var.count_app
  name         = "${var.name_app}-${count.index}"
  machine_type = var.machine_type
  zone         = var.zone
  tags         = var.tags
  boot_disk {
    initialize_params {
      image = var.app_disk_image
    }
  }

  # Метки
  labels = {
    ansible_group = var.label_ansible_group
    env           = var.label_env
  }

  # Параметры пользователя.
  metadata = {
    ssh-keys = "${var.user_name}:${file(var.public_key_path)}"
  }

  # Настройки сети.
  network_interface {
    network = var.network_name

    # использовать ephemeral IP для доступа в Интернет
    access_config {
      nat_ip = element(google_compute_address.app_ip.*.address, count.index)
    }
  }

  # Параметры подключения провижионеров.
  connection {
    type        = var.connection_type
    user        = var.user_name
    agent       = false
    private_key = file(var.private_key_path)
  }
}

resource "google_compute_address" "app_ip" {
  count  = var.count_app
  name   = "${var.app_ip_name}-${count.index}"
  region = var.region
}
