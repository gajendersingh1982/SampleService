prefix = "tf"
region_name = "virginia"
service = "gb"
stage = "stg"
vpc_region = "us-east-1" 

tags = {
    "Service" = "gb"
    "Stage"     = "stg"
}

# Instance Details
instance_type_batch = "t3.medium"
instance_type_mail_train = "t3.medium"
instance_type_gateway = "t3.nano"
key_name = "service_stg"
batch_ami_name = "tf-virginia-stg-gb-batch-*"
mail_train_ami_name = "mail_galaxy_store_*"

# Firewall variables
restrictedIP = ["223.235.161.164/32", "103.81.106.248/30"]
#                      SEA IP,             SRID IP

network_backend_state = "badge/stg/us-east-1/network/terraform.tfstate"
