resource "google_storage_bucket" "amarriner" {
  name     = var.bucket_name
  location = var.region
}
