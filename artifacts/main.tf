resource "google_artifact_registry_repository" "amarriner" {
  location      = "us-east4"
  repository_id = var.repository_id
  description   = "Testing"
  format        = "DOCKER"
}
