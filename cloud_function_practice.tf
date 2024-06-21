# Define a storage bucket to hold the function code
resource "google_storage_bucket" "bucket_for_my_function_mcit" {
  name     = "test-bucket-mcit-practice"
  location = "northamerica-northeast1"
}

# Upload the file containing the function code to the storage bucket
resource "google_storage_bucket_object" "archive" {
  name   = "function_code_mcit_practice.zip"
  bucket = google_storage_bucket.bucket_for_my_function_mcit.name
  source = "salomoncloud/gcp_salomon_practice/function_code/main.py"
}

# Define the cloud function resource
resource "google_cloudfunctions_function" "function" {
  name        = "function-test"
  description = "My function"
  runtime     = "python312"
  available_memory_mb   = 128
  source_archive_bucket = google_storage_bucket.bucket.name
  source_archive_object = google_storage_bucket_object.archive.name
  trigger_http          = true
  entry_point           = "hello_world"  # entry point matches the function name in main.py
}

# IAM entry for all users to invoke the function
resource "google_cloudfunctions_function_iam_member" "invoker" {
  project        = google_cloudfunctions_function.function.project
  region         = google_cloudfunctions_function.function.region
  cloud_function = google_cloudfunctions_function.function.name
  role   = "roles/cloudfunctions.invoker"
  member = "allUsers"
}
