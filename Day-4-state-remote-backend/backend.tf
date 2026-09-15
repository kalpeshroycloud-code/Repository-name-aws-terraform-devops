terraform {
  backend "s3" {
    bucket = "bucketforterraformkp"
    key    = "terraform.tfstate"
    region = "sa-east-1"
  }
}
