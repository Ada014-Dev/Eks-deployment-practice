# resource "aws_s3_bucket" "state_lock" {
#   bucket = "my-state-lock-bucket-adadev-2024"
#   tags = {
#     Name        = "My bucket"
#     Environment = "production"
#   }
# }

# resource "aws_s3_bucket_versioning" "versioning_state_lock" {
#   bucket = aws_s3_bucket.state_lock.id
#   versioning_configuration {
#     status = "Enabled"
#   }
# }