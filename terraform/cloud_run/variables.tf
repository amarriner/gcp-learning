variable "cloud_run_job_name" {
  type = string
}

variable "docker_image" {
  type = string
}

variable "docker_tag" {
  type = string
}

variable "region" {
  type    = string
  default = "us-east4"
}

variable "repository_id" {
  type = string
}

