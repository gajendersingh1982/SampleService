# Define an Amazon Linux AMI.
data "aws_ami" "batch_ami" {
  most_recent = true

  owners = ["self"]

  filter {
    name   = "name"
    values = [var.batch_ami_name]
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

module "batch" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "2.13.0"
  
  #essential [required for Infra Governance]
  name                    = format("%s-%s-%s-%s-batch", var.prefix, var.region_name, var.stage, var.service)
  instance_count          = var.batch_count

  ami                     = data.aws_ami.batch_ami.id
  instance_type           = var.instance_type_batch
  key_name                = var.key_name
  monitoring              = false
  disable_api_termination = true

  vpc_security_group_ids  = [module.batch_sg.this_security_group_id]
  subnet_ids               = data.terraform_remote_state.infra.outputs.public_subnets

  # set instance profile to give EC2 read only permissions
  iam_instance_profile = aws_iam_instance_profile.ec2_instance_profile_batch.name

  root_block_device = [
    {
      volume_type = "gp2"
      volume_size = 100
    }
  ]
  
  tags                    = var.tags
}

# EIP for Batch server
resource "aws_eip" "eip_batch" {
  vpc = true
  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_eip_association" "eip_assoc" {
  instance_id = module.batch.id[0]
  allocation_id = aws_eip.eip_batch.id
}