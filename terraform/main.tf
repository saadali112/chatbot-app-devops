provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "chatbot_app" {
  ami           = "ami-053b0d53c279acc90" # Ubuntu 22.04 LTS
  instance_type = "t2.micro"
  key_name      = "chatbot-key"       # Your existing key pair

  user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install docker.io -y
              sudo systemctl start docker
              sudo docker run -d -p 80:80 your-dockerhub/chatbot-app
              EOF

  vpc_security_group_ids = [aws_security_group.chatbot_sg.id]

  tags = {
    Name = "Chatbot-App"
  }
}

resource "aws_security_group" "chatbot_sg" {
  name        = "chatbot-security-group"
  description = "Allow HTTP and SSH traffic"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
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

output "instance_public_ip" {
  value = aws_instance.chatbot_app.public_ip
}