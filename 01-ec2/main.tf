

# Security Group (allow SSH from anywhere)
resource "aws_security_group" "ssh_sg" {
  name        = "allow-ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = "vpc-0203fa26c49d433f6"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # open to all for testing
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 Instance
resource "aws_instance" "ec2" {
  ami                         = "ami-09c813fb71547fc4f" # Amazon Linux 2 (us-east-1)
  instance_type               = "t3.small"
  subnet_id                   = "subnet-026fa8e1dc737230f"
  vpc_security_group_ids      = [aws_security_group.ssh_sg.id]
  associate_public_ip_address = true
  availability_zone           = "us-east-1d"

  tags = {
    Name = "EC2-Jenkins"
  }
}

# Output public IP
output "instance_ip" {
  value = aws_instance.ec2.public_ip
}
