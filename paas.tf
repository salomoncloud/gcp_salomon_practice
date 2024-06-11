resource "google_cloud_run_service" "cloud-run" {
  name     = "cloudrun-class-work"
  project = "1048749546373"
  region  = "northamerica-northeast1-a"

  template {
    spec {
      containers {
        image = "us-docker.pkg.dev/1048749546373/container/hello"
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}
