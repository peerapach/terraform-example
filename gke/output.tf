output "endpoint" {
    value = google_container_cluster.primary.endpoint
}

output "master_version" {
    value = google_container_cluster.primary.master_version   
}

output "node_version" {
    value = google_container_cluster.primary.node_version   
}