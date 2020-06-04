terraform {
  required_version = ">= 0.12"
}

# Specify the provider (GCP, AWS, Azure)
provider "google" {
    credentials = file("credentials.json")
    project     = var.project
    region      = var.region
    zone        = var.zone
}

