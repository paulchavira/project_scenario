variable "aws_access_key" {
  description = "AWS access key"
  sensitive = true
}

variable "aws_secret_key" {
  description = "AWS secret key"
  sensitive = true
}
variable "aws_machine_type" {
  description = "Machine type for AWS EC2 instances"
  default     = "t2.micro"
}
variable "aws_key_name" {
  description = "Name of the AWS key pair"
  default     = "best"
}
variable "instance_name" {
  description = "Name of the instance"
  default     = "MoodleService"
}