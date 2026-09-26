terraform {
  backend "s3" {
    bucket         = "s3versioningforterraformstate"
    region         = "eu-north-1"
    key            = "terraform.tfstate"
    dynamodb_table = "terraform-state-lock-dynamo-versioning-db"
    encrypt        = true
  }
}