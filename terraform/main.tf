provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "chatbot_sg" {
  name        = "chatbot-sg"
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

resource "aws_instance" "chatbot_app" {
  ami           = "ami-053b0d53c279acc90" # Ubuntu 22.04 LTS
  instance_type = "t2.micro"
  key_name      = "chatbot-key" # Must match the key you created

  vpc_security_group_ids = [aws_security_group.chatbot_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update -y
              sudo apt-get install docker.io -y
              sudo systemctl start docker
              sudo docker run -d -p 80:80 your-dockerhub-username/chatbot-app
              EOF

  tags = {
    Name = "Chatbot-App"
  }
}

output "instance_public_ip" {
  value = aws_instance.chatbot_app.public_ip
}