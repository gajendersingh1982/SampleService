prefix = "tf"
region_name = "virginia"
service = "gb"
stage = "dev"
vpc_region = "us-east-1" 

tags = {
    "Service" = "gb"
    "Stage"     = "dev"
}

# Instance Details
instance_type_batch = "t3.medium"
batch_count = "1"

instance_type_mail_train = "t3.medium"
mail_train_count = "0"

instance_type_gateway = "t3.nano"
gateway_count = "0"

key_name = "service_dev"
batch_ami_name = "tf-virginia-dev-gb-batch-1589707255"
mail_train_ami_name = "mail_galaxy_store_*"

# Firewall variables
restrictedIP = ["223.235.161.164/32", "103.81.106.248/30"]
#                      SEA IP,             SRID IP

network_backend_state = "badge/dev/us-east-1/network/terraform.tfstate"
