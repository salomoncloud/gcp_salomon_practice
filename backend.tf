terraform {
  cloud {
    organization = "gcp_practice"

    workspaces {
      name = "gcp_salomon_practice"
    }
  }
}
