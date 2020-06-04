data "google_container_cluster" "primary" {
    name     = "${var.cluster_name}"
    location = "${var.zone}"
}

output "endpoint" {
    value = data.google_container_cluster.primary.endpoint
}

output "instance_group_urls" {
    value = data.google_container_cluster.primary.instance_group_urls
}

output "node_config" {
    value = data.google_container_cluster.primary.node_config
}

output "node_pools" {
    value = data.google_container_cluster.primary.node_pool   
}