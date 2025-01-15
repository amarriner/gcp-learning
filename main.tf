terraform {
  backend "gcs" {
    bucket  = "amarriner-gcp"
    prefix  = "terraform/state/gcp-learning"
  }
}

provider "google" {
  project     = "operating-bolt-447818-b5"
  region      = "us-east4"
}

module "artifacts" {
  source = "./artifacts"

  repository_id = var.repository_id
}

module "bucket" {
  source = "./bucket"

  bucket_name = var.bucket_name
}

module "database" {
  source = "./firestore"

  database_name = var.database_name
}

