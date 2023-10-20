

resource "google_vpc_access_connector" "connector" {
  name          = "vpc-servless-db-admin"
  #region        = var.region
  project       = var.project_id
  # e.g. "10.8.0.0/28"
  ip_cidr_range = "10.20.0.0/28" #var.serverless_vpc_conn_cidr
  network       = "fenix-gcp-general-vpc"  #var.network
  region = var.region
}

resource "google_compute_global_address" "private_ip_range" {
  name          = "private-ip-range"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 16
  network       = "projects/${var.project_id}/global/networks/fenix-gcp-general-vpc"  #google_compute_network.vpc_network.self_link
}


resource "google_service_networking_connection" "private_vpc_connection" {
  network       = "projects/${var.project_id}/global/networks/fenix-gcp-general-vpc"  # google_compute_network.vpc_network.self_link
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.private_ip_range.name]
}
