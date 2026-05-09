resource "google_compute_instance_template" "template" {
  name_prefix  = "web-template-"
  machine_type = var.machine_type

  tags = ["web-server"]

  disk {
    auto_delete  = true
    boot         = true

    source_image = var.image
  }

  network_interface {
    subnetwork = var.subnet
    access_config {
      
    }
  }

  service_account {
    email  = var.service_account_email
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }

  metadata_startup_script = <<-EOF
#!/bin/bash

apt-get update
apt-get install -y nginx

cat <<HTML > /var/www/html/index.html
<h1>Terraform GCP MIG Project</h1>
<p>Served from $(hostname)</p>
HTML

systemctl enable nginx
systemctl restart nginx
EOF
}

resource "google_compute_region_instance_group_manager" "mig" {
  name   = "web-mig"
  region = var.region

  base_instance_name = "web"

  version {
    instance_template = google_compute_instance_template.template.id
  }

  target_size = var.target_size

  named_port {
    name = "http"
    port = 80
  }

  auto_healing_policies {
    health_check      = google_compute_health_check.autohealing.id
    initial_delay_sec = 300
  }
}

resource "google_compute_health_check" "autohealing" {
  name = "mig-health-check"

  http_health_check {
    port = 80
  }
}