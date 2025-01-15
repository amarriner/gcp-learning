output "bucket_id" {
  value = module.bucket.bucket_id
}

# output "cloud_run_id" {
#   value = module.cloud_run.cloud_run_id
# }

output "database_id" {
  value = module.database.database_id
}

output "database_uid" {
  value = module.database.database_uid
}

output "function_id" {
  value = module.function.function_id
}

output "function_url" {
  value = module.function.function_url
}

output "identity_provider_id" {
  value = module.workflow.identity_provider_id
}

output "identity_provider_name" {
  value = module.workflow.identity_provider_name
}

output "repository_id" {
  value = module.artifacts.repository_id
}

output "service_account_email" {
  value = module.workflow.email
}

output "service_account_id" {
  value = module.workflow.id
}
