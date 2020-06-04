variable "project" {
    default = "PROJECT_NAME"
}

variable "cluster_name" {
    default = "my-gke-cluster"
}

variable "node_pool_name" {
    default = "gke-nodepool-cluster"
}

variable "node_count" {
    default = "3"
}

variable "zone" {
    default = "asia-southeast1-a"
}

variable "region" {
    default = "asia-southeast1"
}
