resource "google_cloud_run_service" "cloud-run" {
  name     = "cloudrun-class-work"
  project = put your project id in a protected env var
  location  = "northamerica-northeast1-a"

  template {
    spec {
      containers {
        image = "us-docker.pkg.dev/project id/container/hello"
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}
