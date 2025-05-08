provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "chatbot_server" {
  ami           = "ami-0c02fb55956c7d316" # Amazon Linux 2 AMI
  instance_type = "t3.nano"               # ✅ Changed from t2.micro to t3.nano
  key_name      = "chatbot-key"           # ✅ Replace with your actual key name

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
