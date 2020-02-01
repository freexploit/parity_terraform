provider "aws" {
  version = "~> 2.0"
  profile = "upway"
  region = "us-west-2"

}

data "aws_ami" "parity" {

  #executable_users = ["self"]
  most_recent = true
  owners = ["self"]

  filter {
    name = "name"
    values = ["parity-ethereum-*"]
  }
  
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow ssh"
  description = "Allow ssh inbound traffic"
  vpc_id      = "vpc-b1841bc9"

  ingress {
    # TLS (change to whatever ports you need)
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    cidr_blocks = ["190.113.111.24/32"]
  }

  ingress {
    # TLS (change to whatever ports you need)
    from_port   = 30303
    to_port     = 30303
    protocol    = "tcp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    # TLS (change to whatever ports you need)
    from_port   = 30303
    to_port     = 30303
    protocol    = "udp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}


resource "aws_key_pair" "login" {
  key_name = "login"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC34O5AC/nV4oek/2dLk+i6HqwKjTS3v9+tuW3LBMXloCXYyfa1BXz3/0MlD1K7udTB5bmrHhEYDThrQ+sb8g07YGJzQpLNR41GTlkcoIRDDVPa15lnBVbEKREG/8PzfmQXLrPm550x0uoIF16F8qi5hlf2OnFeae3iqW57iJ2cBHA1p237jp+BrYKCV0qwBmCgAeAFsBylPjMsBOXN6nkuHqln9NFa7EZzLMzMI/nOx8YUyN9cvc5TkIb24aoatM9h/rKD/vz5PAGZdRYwMBKlJAXNOstEK9NVhMLrsuRmkT0nm0RoS/YRSNYlg1yjjp+2lYmSSKUsjfujb6NdFKUB freexploit@asgard"

}

resource "aws_instance" "parity-client" {
  ami = data.aws_ami.parity.id
  instance_type = "m5.large"
  vpc_security_group_ids = [ aws_security_group.allow_ssh.id ]
  key_name = aws_key_pair.login.key_name
  root_block_device  {
    volume_size = 600
  }

  tags = {
    Name = "parity-client"
  }
}



