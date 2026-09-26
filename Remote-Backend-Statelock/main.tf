terraform {
  backend "s3" {
    bucket         = "prod-s3-bucket"              # Name of the S3 bucket where the state will be stored.
    key            = "terraform.tfstate"
    region         = "us-east-1"

  }
}
