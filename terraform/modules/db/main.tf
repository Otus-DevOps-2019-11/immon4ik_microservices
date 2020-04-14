# Основное ресурса инстанса.
resource "google_compute_instance" "db" {
  name         = var.name_db
  machine_type = var.machine_type
  zone         = var.zone
  tags         = var.tags
  boot_disk {
    initialize_params {
      image = var.db_disk_image
    }
  }

  # Метки
  labels = {
    ansible_group = var.label_ansible_group
    env           = var.label_env
  }

  # Настройки сети.
  network_interface {
    network = var.network_name
    access_config {}
  }

  # Параметры пользователя.
  metadata = {
    ssh-keys = "${var.user_name}:${file(var.public_key_path)}"
  }
  # Зависимости.
  depends_on = [var.modules_depends_on]
}

# Основное ресурса брандмауэра.
resource "google_compute_firewall" "firewall_mongo" {
  name    = var.fw_name
  network = var.network_name
  allow {
    protocol = var.fw_allow_protocol
    ports    = var.fw_allow_ports
  }
  target_tags = var.fw_target_tags
  source_tags = var.fw_source_tags
}
