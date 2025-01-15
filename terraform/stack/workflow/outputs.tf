output "email" {
  value = google_service_account.amarriner.email
}

output "id" {
  value = google_service_account.amarriner.id
}

output "identity_provider_id" {
  value = google_iam_workload_identity_pool_provider.amarriner.id
}

output "identity_provider_name" {
  value = google_iam_workload_identity_pool_provider.amarriner.name
}
