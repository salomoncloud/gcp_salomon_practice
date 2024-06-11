terraform {
  required_providers {
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 4.0"
    }
  }
}
provider "google" {
  project = put your project id in a protected env var
  region  = "northamerica-northeast1"
}

provider "google-beta" {
}
