provider "google" {
  project = "turing-zone-311006"
  region  = "us-central1"
}

module "gcs_buckets" {
  source     = "terraform-google-modules/cloud-storage/google"
  version    = "~> 1.7"
  project_id = "turing-zone-311006"
  names      = ["first-09-awe-1", "second-98-88-i"]
  prefix     = "my-mrs-8-9"

}
