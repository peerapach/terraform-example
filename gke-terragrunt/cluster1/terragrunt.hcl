include {
    path = find_in_parent_folders()
}

terraform {
    source = "github.com/peerapach/terraform-example//gke-module-terragrunt"
}

inputs = {
    project = "fluid-analogy-267415"
    cluster_name = "gke-cluster1"
    node_pool_name = "gke-cluster1-nodepool"
    node_count_min = "1"
    node_count_max = "2"
}