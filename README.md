# gcp-learning

## Notes

This can't be run all in one step because the cloud run job requires a specific
image in the artifact registry that the TF won't provide. Obviously that means
we should split this into separate TF runs but this is just for learning purposes.
So to get it to deploy I ran it once, the cloud run job failed but everything
else was created. Then I pushed a docker image up to the repo (using the
docker/git/Dockerfile to build) and then re-ran TF apply which created the job properly

## Sample Output

``` Context:json
{
  "bucket_id": {
    "sensitive": false,
    "type": "string",
    "value": "amarriner-gcp-learning-bucket"
  },
  "cloud_run_id": {
    "sensitive": false,
    "type": "string",
    "value": "projects/operating-bolt-447818-b5/locations/us-east4/jobs/amarriner-gcp-learning-job"
  },
  "database_id": {
    "sensitive": false,
    "type": "string",
    "value": "projects/operating-bolt-447818-b5/databases/amarriner-gcp-learning-database"
  },
  "database_uid": {
    "sensitive": false,
    "type": "string",
    "value": "f14539c5-8399-4505-8920-fe6b7e1b0bd7"
  },
  "function_id": {
    "sensitive": false,
    "type": "string",
    "value": "projects/operating-bolt-447818-b5/locations/us-east4/functions/amarriner-gcp-learning-function"
  },
  "function_url": {
    "sensitive": false,
    "type": "string",
    "value": "https://us-east4-operating-bolt-447818-b5.cloudfunctions.net/amarriner-gcp-learning-function"
  },
  "repository_id": {
    "sensitive": false,
    "type": "string",
    "value": "projects/operating-bolt-447818-b5/locations/us-east4/repositories/amarriner-gcp-learning-repository"
  }
}
```

## Sample cloud run job logs

``` Context: json
[
  {
    "textPayload": "git version 2.47.0",
    "insertId": "6787d8b6000aef76df59bb52",
    "resource": {
      "type": "cloud_run_job",
      "labels": {
        "job_name": "amarriner-gcp-learning-job",
        "project_id": "operating-bolt-447818-b5",
        "location": "us-east4"
      }
    },
    "timestamp": "2025-01-15T15:48:06.716662Z",
    "labels": {
      "instanceId": "00ca3695d21834a2b7e5e0a8aa3bcf52e5b01ca6b40b14c21188d72222084fd4e02caa9d03b5f247efe3d997d0c1b023a1b8a835934fc79dba3e9a9b7a157e9ccfc3e190",
      "run.googleapis.com/task_attempt": "0",
      "run.googleapis.com/task_index": "0",
      "run.googleapis.com/execution_name": "amarriner-gcp-learning-job-rmxlb"
    },
    "logName": "projects/operating-bolt-447818-b5/logs/run.googleapis.com%2Fstdout",
    "receiveTimestamp": "2025-01-15T15:48:06.721909169Z"
  },
  {
    "textPayload": "Container called exit(0).",
    "insertId": "6787d8b6000b161a0fd98a18",
    "resource": {
      "type": "cloud_run_job",
      "labels": {
        "location": "us-east4",
        "project_id": "operating-bolt-447818-b5",
        "job_name": "amarriner-gcp-learning-job"
      }
    },
    "timestamp": "2025-01-15T15:48:06.726482Z",
    "severity": "INFO",
    "labels": {
      "run.googleapis.com/execution_name": "amarriner-gcp-learning-job-rmxlb",
      "run.googleapis.com/task_index": "0",
      "container_name": "worker",
      "run.googleapis.com/task_attempt": "0",
      "instanceId": "00ca3695d21834a2b7e5e0a8aa3bcf52e5b01ca6b40b14c21188d72222084fd4e02caa9d03b5f247efe3d997d0c1b023a1b8a835934fc79dba3e9a9b7a157e9ccfc3e190"
    },
    "logName": "projects/operating-bolt-447818-b5/logs/run.googleapis.com%2Fvarlog%2Fsystem",
    "receiveTimestamp": "2025-01-15T15:48:06.728994333Z"
  }
]
```

## Sample Function Output

```
~ $ curl -X POST https://{function_url} \
> -H "Authorization: bearer $(gcloud auth print-identity-token)" \
> -H "Content-Type: application/json" \
> -d '{  "name": "Hello World" }'
Hello Hello World!
```
