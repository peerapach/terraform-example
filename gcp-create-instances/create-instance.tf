resource "google_compute_disk" "docker-workshop-" {
  count    = var.node_count
  name     = "docker-workshop-${count.index}"
  type     = "pd-standard"
  zone     = var.zone
  size     = 20
  snapshot = "baseimage"
}

resource "google_compute_instance" "default" {
  count        = var.node_count
  name         = "docker-workshop-${count.index}"
  machine_type = "e2-micro"
  zone         = var.zone

  boot_disk {
    source = element(google_compute_disk.docker-workshop-.*.name, count.index)
  }

  network_interface {
    network = "default"

    access_config {
      // Include this section to give the VM an external ip address
    }
  }

  metadata_startup_script = "sudo apt-get update && sudo apt-get install docker docker.io"

  // Apply the firewall rule to allow external IPs to access this instance
  tags = ["docker-server"]
}

resource "google_compute_firewall" "docker-server" {
  name    = "default-allow-docker-terraform"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80", "8080"]
  }

  // Allow traffic from everywhere to instances with an http-server tag
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["docker-server"]
}

output "instance_ips" {
  value = google_compute_instance.default.*.network_interface.0.access_config.0.nat_ip
}

