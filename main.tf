terraform {
  backend "gcs" {
    bucket = "amarriner-gcp"
    prefix = "terraform/state/gcp-learning"
  }
}

provider "google" {
  project = "operating-bolt-447818-b5"
  region  = var.region
}

data "google_project" "project" {
}

module "artifacts" {
  source = "./artifacts"

  repository_id = var.repository_id
  region        = var.region
}

module "bucket" {
  source = "./bucket"

  bucket_name = var.bucket_name
  region      = var.region
}

module "cloud_run" {
  source = "./cloud_run"

  cloud_run_job_name = var.cloud_run_job_name
  docker_image       = var.docker_image
  docker_tag         = var.docker_tag
  project_id         = data.google_project.project.project_id
  region             = var.region
  repository_id      = var.repository_id
}

module "database" {
  source = "./firestore"

  database_name = var.database_name
  region        = var.region
}

module "function" {
  source = "./function"

  bucket_name   = var.source_bucket_name
  function_name = var.function_name
  region        = var.region
}
