data "archive_file" "function_source_archive" {
  type        = "zip"
  source_dir  = "${path.module}/src"
  output_path = "${path.module}/${var.function_name}.zip"
}

resource "google_storage_bucket_object" "function_source_object" {
  name   = "src/${var.function_name}.zip"
  bucket = var.bucket_name
  source = "${path.module}/${var.function_name}.zip"
}

resource "google_cloudfunctions2_function" "amarriner" {
  name     = var.function_name
  location = var.region

  build_config {
    runtime     = "python39"
    entry_point = "hello_http"
    source {
      storage_source {
        bucket = var.bucket_name
        object = google_storage_bucket_object.function_source_object.name
      }
    }
  }

  # TODO: Temporary because I'm not explicitly setting any of these
  lifecycle {
    ignore_changes = [
      service_config
    ]
  }
}
