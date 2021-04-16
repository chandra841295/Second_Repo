
resource "google_compute_instance" "default" {
  name         = "test-01-test32-0"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"

  tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
      type  = "pd-ssd"
      size  = 50
    }
  }

/*
  // Local SSD disk
  scratch_disk {
    interface = "SCSI"
  }
*/
  network_interface {
    network = "vpc-sn"

    access_config {
      // Ephemeral IP
    }
  }

  metadata = {
    foo = "bar"
  }

  metadata_startup_script = "echo hi > /test.txt"
/*
  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = test-proqa@qp-strides-pharma-2021-04.iam.gserviceaccount.com
    scopes = ["cloud-platform"]
  }
*/
}
