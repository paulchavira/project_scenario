# Define the AWS provider
provider "aws" {
  region = "us-east-1" # Update with your desired region
}

# Create a security group allowing SSH, HTTP, and HTTPS traffic
resource "aws_security_group" "example_sg" {
  name        = "launch-wizard-2" #this creates your security group with this name
  description = "launch-wizard-2 created 2024-03-18T23:08:24.882Z"
  vpc_id      = "vpc-024b2a721e710c568" #put your own vpc id in here

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound rule allowing all traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create an EC2 instance associated with the security group
resource "aws_instance" "example_instance" {
  ami                          = "ami-080e1f13689e07408"
  instance_type                = "t2.micro"
  key_name                     = "tyui"  # Specify the name of the key pair
  ebs_optimized                = false
  associate_public_ip_address  = true
  security_groups              = [aws_security_group.example_sg.name] # make this the name of the created security group

  tags = {
    Name = "example_tag"
  }

  metadata_options {
    http_tokens               = "required"
    http_endpoint             = "enabled"
    http_put_response_hop_limit = 2
  }
}
