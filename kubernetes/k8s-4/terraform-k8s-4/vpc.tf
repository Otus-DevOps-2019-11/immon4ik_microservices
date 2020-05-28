provider "google" {
  project = var.project_id
  region  = var.region
}

# VPC
resource "google_compute_network" "vpc" {
  name                    = "${var.project_id}-vpc"
  auto_create_subnetworks = "false"
}

# Subnet
resource "google_compute_subnetwork" "subnet" {
  name          = "${var.project_id}-subnet"
  region        = var.region
  network       = google_compute_network.vpc.name
  ip_cidr_range = "10.10.0.0/24"

}

resource "google_compute_firewall" "firewall-k8s" {
  name    = "allow-k8s"
  network = google_compute_network.vpc.name
  allow {
    protocol = "tcp"
    ports    = var.ports
  }
  direction     = "INGRESS"
  source_ranges = var.source_ranges
  target_tags   = ["gke-node", "${var.project_id}-gke"]
}
