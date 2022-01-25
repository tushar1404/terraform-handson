# variable "project_name" {
#   type = string
#   default = "<project-name>"
# }

# variable "project_region" {
#   type = string
#   default = "us-central1"
# }

# variable "project_zone" {
#     type = string
#     default = "us-central1-c"
# }

# provider "google" {
#   project = var.project_name
#   region  = var.project_region
#   zone    = var.project_zone
# }


provider "google" {
  project = "<project-name>"
  region  = "us-central1"
  zone    = "us-central1-c"
}

data "template_file" "redis_startup_script" {
  template = "${file("${path.module}/startup_script.sh")}"
}


resource "google_compute_instance" "default" {
 name         = "terraform-instance"
 machine_type = "f1-micro"
 zone         = "us-central1-c"

 boot_disk {
   initialize_params {
     image = "debian-cloud/debian-10"
   }
 }

 tags = ["redis"]

 metadata_startup_script = data.template_file.redis_startup_script.rendered

 network_interface {
   network = "default"

   access_config {}
 }
}
