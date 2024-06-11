resource "google_cloud_run_service" "cloud-run" {
  name     = "cloudrun-class-work"
  location = "northamerica-northeast1-a"

  template {
    spec {
      containers {
        image = "us-docker.pkg.dev/cloudrun/container/hello"
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}
