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

module "workflow" {
  source = "./workflow"

  account_id                         = var.account_id
  project_id                         = data.google_project.project.project_id
  artifact_repository_name           = module.artifacts.repository_id
  workload_identity_pool_id          = var.workload_identity_pool_id
  workload_identity_pool_provider_id = var.workload_identity_pool_provider_id
}
