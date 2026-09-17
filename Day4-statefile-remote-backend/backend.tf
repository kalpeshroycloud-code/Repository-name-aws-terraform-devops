terraform {
  backend "s3" {
    bucket = "thisbucketosforterraform"
    key    = "Day4/terraform.tfstate"
    region = "eu-north-1"
  }
}