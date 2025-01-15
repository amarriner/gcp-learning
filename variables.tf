variable "bucket_name" {
  type = string
}

variable "cloud_run_job_name" {
  type = string
}

variable "docker_image" {
  type = string
}

variable "docker_tag" {
  type = string
}

variable "database_name" {
  type = string
}

variable "function_name" {
  type = string
}

variable "repository_id" {
  type = string
}

variable "region" {
  type    = string
  default = "us-east4"
}

variable "source_bucket_name" {
  type = string
}
