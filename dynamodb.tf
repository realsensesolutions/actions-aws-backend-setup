locals {
  # The table must have a primary key named LockID.
  # See below for more detail.
  # https://www.terraform.io/docs/backends/types/s3.html#dynamodb_table
  lock_key_id = "LockID"
}

resource "aws_dynamodb_table" "lock" {
  name                        = "actions-aws-backend-setup-${var.instance}"
  billing_mode                = "PAY_PER_REQUEST"
  hash_key                    = local.lock_key_id
  deletion_protection_enabled = true

  attribute {
    name = local.lock_key_id
    type = "S"
  }

  tags = local.tags
}