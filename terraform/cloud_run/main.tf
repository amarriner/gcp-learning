# us-east4-docker.pkg.dev/operating-bolt-447818-b5/amarriner-gcp-learning-repository
terraform {
  backend "gcs" {
    bucket = "amarriner-gcp"
    prefix = "terraform/state/gcp-learning/cloud_run"
  }
}

provider "google" {
  project = "operating-bolt-447818-b5"
  region  = var.region
}

data "google_project" "project" {
}

resource "google_cloud_run_v2_job" "amarriner" {
  name                = var.cloud_run_job_name
  location            = var.region
  deletion_protection = false

  template {
    template {
      containers {
        image = "${var.region}-docker.pkg.dev/${data.google_project.project.project_id}/${var.repository_id}/${var.docker_image}:${var.docker_tag}"
      }
    }
  }
}
