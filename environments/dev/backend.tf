terraform {
  backend "gcs" {
    bucket = "ishan-terraform-state-2026"
    prefix = "dev"
  }
}
