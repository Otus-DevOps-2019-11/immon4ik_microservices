variable project {
  description = "Project ID"
}

variable region {
  type    = string
  default = "europe-west1"
}

variable count_app {
  type    = string
  default = "1"
}

variable name_app {
  type    = string
  default = "docker-host"
}

variable machine_type {
  type    = string
  default = "g1-small"
}

variable zone {
  type    = string
  default = "europe-west1-b"
}

variable tags {
  type    = list(string)
  default = ["docker-machine"]
}

variable app_disk_image {
  type    = string
  default = "docker-monolith-image"
}

variable label_ansible_group {
  type    = string
  default = "docker-host"
}

variable label_env {
  type        = string
  description = "dev, stage, prod and etc."
  default     = "dev"
}

variable network_name {
  type    = string
  default = "default"
}

variable user_name {
  type    = string
  default = "immon4ik"
}

variable public_key_path {
  type    = string
  default = ""
}

variable private_key_path {
  type    = string
  default = ""
}

variable connection_type {
  type    = string
  default = "ssh"
}

variable app_ip_name {
  type    = string
  default = "reddit-app-ip"
}

variable location {
  type    = string
  default = "europe-west1"
}
