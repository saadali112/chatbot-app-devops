provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "chatbot_server" {
  ami           = "ami-0c02fb55956c7d316" # Amazon Linux 2 AMI (Free tier eligible)
  instance_type = "t2.micro"
  key_name      = "chatbot-key"           # ✅ Your key pair name

  tags = {
    Name = "chatbot-server"
  }

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y docker git
              service docker start
              usermod -a -G docker ec2-user
              docker run -d -p 80:80 saadali112/chatbot-frontend:latest
              EOF
}
