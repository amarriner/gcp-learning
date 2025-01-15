resource "google_artifact_registry_repository" "amarriner" {
  location      = var.region
  repository_id = var.repository_id
  description   = "Testing"
  format        = "DOCKER"
}
