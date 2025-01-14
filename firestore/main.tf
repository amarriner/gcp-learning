resource "google_firestore_database" "amarriner" {
  name        = var.database_name
  location_id = "us-east4"
  type        = "FIRESTORE_NATIVE"
}
