resource "aws_instance" "dev" {
    ami               = "ami-03cc2fdb1443ab619"
    instance_type     = "t3.micro"
    key_name          = "outputkeypair"
    availability_zone = "eu-north-1a"
    tags = {
        Name = "dev"
    }
}


# This backend configuration instructs Terraform to store its state in
terraform {
  backend "s3" {
    bucket         = "thisbucketosforterraformstatelock"              # Name of the S3 bucket where the state will be stored.
    region         = "eu-north-1"                            # AWS region where the S3 bucket is located.
    key            = "Day5/terraform.tfstate"             # Path within the bucket where the state will be read/written.
    dynamodb_table = "terraform-state-lock-dynamo"    # DynamoDB table used for state locking, note: first run day-4-
    encrypt        = true                             # Ensures the state is encrypted at rest in S3.
  }
}