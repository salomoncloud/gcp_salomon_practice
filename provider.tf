terraform {
  required_providers {
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 4.0"
    }
  }
}
provider "google" {
  project = "1048749546373"
  region  = "us-central1"
}

provider "google-beta" {
}
