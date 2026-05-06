resource "google_compute_instance" "vm" {
  name         = var.name
  zone         = var.zone
  machine_type = var.machine_type

  boot_disk {
    initialize_params {
      image = var.image
      size  = var.boot_disk_size_gb
      type  = "pd-balanced"
    }
  }

  // Free-credits friendly: no external IP by default.
  // VM will still be reachable from within the VPC/subnet.

  network_interface {
    subnetwork = var.subnet
  }

  // Minimal service account usage.
  service_account {
    email  = var.service_account_email
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }

  metadata = {
    // Keep startup minimal; also avoids extra software.
    ssh-keys = var.ssh_public_key
  }

  tags = var.tags
}
