terraform {
    required_version = ">= 0.12"
}

resource "google_container_cluster" "primary" {
    name     = "${var.cluster_name}"
    location = "${var.zone}"

    remove_default_node_pool = true
    initial_node_count       = "${var.node_count_min}"

    master_auth {
        username = ""
        password = ""

        client_certificate_config {
            issue_client_certificate = false
        }
    }
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
    name       = "${var.node_pool_name}"
    location   = "${var.zone}"
    cluster    = google_container_cluster.primary.name
    node_count = "${var.node_count_min}"

    autoscaling {
        min_node_count = "${var.node_count_min}"
        max_node_count = "${var.node_count_max}"
    }

    node_config {
        preemptible  = true
        machine_type = "e2-standard-2"

        metadata = {
            disable-legacy-endpoints = "true"
        }

        oauth_scopes = [
        "https://www.googleapis.com/auth/logging.write",
        "https://www.googleapis.com/auth/monitoring",
        ]
    }
}