# resource "google_compute_firewall" "redis_public_ingress" {
#   project     = var.project_name
#   name        = "redis-public-firewall"
#   network     = "default"
#   description = "Creates firewall rule targeting tagged instances"

#   allow {
#     protocol  = "tcp"
#     ports     = ["6379"]
#   }

#   source_ranges = ["0.0.0.0/0"]
#   target_tags = ["redis"]
# }