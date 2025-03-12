provider "aws" {
  region = "us-east-1" # Change to your preferred AWS region
}

resource "aws_vpc" "vpn_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true
}

resource "aws_subnet" "vpn_subnet" {
  vpc_id                  = aws_vpc.vpn_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a" # Change as needed
}

resource "aws_security_group" "vpn_sg" {
  vpc_id = aws_vpc.vpn_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 1194
    to_port     = 1194
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "vpn_server" {
  ami           = "ami-0c55b159cbfafe1f0" # Update to the latest Amazon Linux 2 AMI
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.vpn_subnet.id
  security_groups = [aws_security_group.vpn_sg.name]

  tags = {
    Name = "OpenVPN-Server"
  }
}

output "vpn_server_public_ip" {
  value = aws_instance.vpn_server.public_ip
}
