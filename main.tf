provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  alias  = "replica"
  region = "us-west-1"
}

module "remote_state" {
  source             = "nozaq/remote-state-s3-backend/aws"
  enable_replication = false
  
  tags = {
    tf-backend = true
    Terraform  = true
  }
  providers = {
    aws         = aws
    aws.replica = aws.replica
  }
}
