# https://github.com/google-github-actions/auth#indirect-wif

resource "google_service_account" "amarriner" {
  account_id  = var.account_id
  description = "Workflow Service Account Github"
}

resource "google_project_iam_custom_role" "amarriner" {
  role_id = "service_account_docker_push"
  title   = "Service Account Docker Push Role"
  permissions = [
    "artifactregistry.dockerimages.get",
    "artifactregistry.dockerimages.list",
    "artifactregistry.repositories.uploadArtifacts"
  ]
}

resource "google_iam_workload_identity_pool" "amarriner" {
  workload_identity_pool_id = var.workload_identity_pool_id
  description               = "Workflow ID Pool Github"
}

resource "google_iam_workload_identity_pool_provider" "amarriner" {
  workload_identity_pool_id          = google_iam_workload_identity_pool.amarriner.workload_identity_pool_id
  workload_identity_pool_provider_id = var.workload_identity_pool_provider_id
  display_name                       = "Github repo Provider"
  attribute_condition                = <<EOT
    assertion.repository_owner_id == "695905" &&
    attribute.repository == "amarriner/gcp-learning" &&
    assertion.ref == "refs/heads/main" &&
    assertion.ref_type == "branch"
EOT
  attribute_mapping = {
    "google.subject"       = "assertion.sub"
    "attribute.actor"      = "assertion.actor"
    "attribute.aud"        = "assertion.aud"
    "attribute.repository" = "assertion.repository"
  }
  oidc {
    issuer_uri = "https://token.actions.githubusercontent.com"
  }
}

resource "google_service_account_iam_binding" "amarriner" {
  service_account_id = google_service_account.amarriner.name
  role               = "roles/iam.workloadIdentityUser"

  members = [
    "principalSet://iam.googleapis.com/${google_iam_workload_identity_pool.amarriner.name}/attribute.repository/amarriner/gcp-learning",
  ]
}