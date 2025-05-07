ECHO is on.
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "chatbot_app" {
  ami           = "ami-053b0d53c279acc90" # Ubuntu 22.04
  instance_type = "t2.micro"
  key_name      = "chatbot-key"       # Your existing key pair
  
  user_data = <<-EOF
              #!/bin/bash
              sudo apt update
              sudo apt install docker.io -y
              sudo systemctl start docker
              sudo docker run -d -p 80:80 your-dockerhub/chatbot-app
              EOF

  tags = {
    Name = "Chatbot-App"
  }
}

resource "aws_security_group" "allow_web" {
  name        = "allow_http"
  description = "Allow HTTP traffic"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}