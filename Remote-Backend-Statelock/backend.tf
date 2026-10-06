terraform {
  backend "s3" {
    bucket         = "nonebucket01"              # Name of the S3 bucket where the state will be stored.
    region         = "eu-north-1"                            # AWS region where the S3 bucket is located.
    key            = "terraform.tfstate"             # Path within the bucket where the state will be read/written.
    #use_lockfile   = true                             # Ensures the state is encrypted at rest in S3.
    dynamodb_table = "dbtable" # Name of the DynamoDB table for state locking.
    encrypt        = true                             # Ensures the state is encrypted at rest in S3.
    
  }
}