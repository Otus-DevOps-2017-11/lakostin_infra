resource "google_compute_firewall" "firewall_ssh" {
  name = "default-allow-ssh"

  network = "default"

  description = "Custom (module) allow SSH from anywhere"

  allow {
    protocol = "tcp"

    ports = [
      "22",
    ]
  }

  source_ranges = "${var.source_ranges}"
}
