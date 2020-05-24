variable "project_id" {
  type        = string
  description = "project id"
}

variable "region" {
  type        = string
  description = "region"
}

variable "zone" {
  type        = string
  description = "zone"
}

variable "source_ranges" {
  type        = list(string)
  description = "IP source range"
}

variable "ports" {
  type        = list(string)
  description = "Port range"
}

variable "gke_username" {
  default     = ""
  description = "gke username"
}

variable "gke_password" {
  default     = ""
  description = "gke password"
}

variable "gke_num_nodes" {
  default     = 2
  description = "number of gke nodes"
}
