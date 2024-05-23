terraform {
    required_providers {
        aws = {
            version = "~> 4.59.0"
        }
    }
    backend "s3" {
        encrypt        = true
    }
}

