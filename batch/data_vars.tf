# Define an Amazon Linux AMI.
data "aws_ami" "batch_ami" {
  most_recent = true

  owners = ["031852407939"]

  filter {
    name   = "name"
    values = ["ami-gb-batch-*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
  
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# Define an Amazon Linux AMI.
data "aws_ami" "ubuntu18" {
  most_recent = true

  owners = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
  
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

/*
data "aws_acm_certificate" "domain" {
  domain    = "*.samsungops.com"
}
*/