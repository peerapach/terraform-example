remote_state {
  backend = "consul"
  config = {
    address = "127.0.0.1:8500"
    path    = "gcp/gke/cluster/${path_relative_to_include()}"
  }
}