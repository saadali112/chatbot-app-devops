# main.tf - Terraform config for deploying chatbot app to AWS EC2
provider "aws" {
  region = "us-east-1"  # Free tier region
}

# Create a security group allowing HTTP traffic
resource "aws_security_group" "chatbot_sg" {
  name        = "chatbot-sg"
  description = "Allow HTTP and SSH access"

  ingress {
    from_port   = 80    # HTTP
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22    # SSH (for debugging)
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # Allow all outbound traffic
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "chatbot-security-group"
  }
}

# Create an EC2 instance (Free Tier eligible)
resource "aws_instance" "chatbot_app" {
  ami           = "ami-053b0d53c279acc90"  # Ubuntu 22.04 LTS
  instance_type = "t2.micro"
  key_name      = "chatbot-key"      # Replace with your EC2 key pair name

  vpc_security_group_ids = [aws_security_group.chatbot_sg.id]

  # User data script to install Docker and run your container
  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update -y
              sudo apt-get install docker.io -y
              sudo systemctl start docker
              sudo docker run -d -p 80:80 --name chatbot-container ${var.docker_image}
              EOF

  tags = {
    Name = "Chatbot-App"
  }
}

# Output the public IP to access your app
output "instance_public_ip" {
  value = aws_instance.chatbot_app.public_ip
}

# Variable for Docker image (define in terraform.tfvars)
variable "docker_image" {
  description = "Docker image name for the chatbot app"
  default     = "your-dockerhub-username/chatbot-app:latest"  # Replace with your image
}