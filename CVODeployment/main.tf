terraform {
  required_providers {
    netapp-cloudmanager = {
      source = "NetApp/netapp-cloudmanager"
    }
  }
}

provider "aws" {
  region = var.region
}

provider "netapp-cloudmanager" {
  refresh_token = var.token
}

# Creating Key Pair
resource "tls_private_key" "SSHKey" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Generate Key Pair
resource "aws_key_pair" "generated_key" {
  key_name   = "MediatorKeyPair"
  public_key = tls_private_key.SSHKey.public_key_openssh
}

# Save the private key locally
resource "local_file" "private_key_pem" {
    content  = tls_private_key.SSHKey.private_key_pem
    filename = "Mediator_private_key.pem"
}

# Save the public key locally
resource "local_file" "public_key_pem" {
    content  = tls_private_key.SSHKey.public_key_pem
    filename = "Mediator_public_key.pem"
}

# Outputs the content of the private key
output "PrivateKey_pem" {
description = "The Private key"
value = tls_private_key.SSHKey.private_key_pem
}

# Outputs the content of the public key
output "PublicKey_pem" {
description = "The Public key"
value = tls_private_key.SSHKey.public_key_pem
}

# Generate Cloud Volume ONTAP HA or Single Node
resource "netapp-cloudmanager_cvo_aws" "cvo-aws" {
  provider = netapp-cloudmanager
  region = var.region
  vpc_id = var.vpc_id
  svm_password = var.password
  client_id = var.client_id
  instance_type = var.instance_type
  license_type = var.ha ? "ha-cot-premium-byol" : "cot-premium-byol"
  name = var.ha ? "TerraformCVOHighAvailable" : "TerraformCVOSingleNode"
  
  # CVO single node variables configuration
  subnet_id = var.ha ? "" : var.subnet_id
  platform_serial_number = var.ha ? "" : var.license_single_node
  
  
  aws_tag {
              tag_key = "CVO-AWS"
              tag_value = "Terraform"
            }
  aws_tag {
              tag_key = "Region"
              tag_value = var.region
            }  
  
  
  # CVO HA variables configuration
  is_ha = var.ha
  failover_mode = var.ha ? "FloatingIP" : "PrivateIP"
  node1_subnet_id = var.ha ? var.node1_subnet_id : "" 
  node2_subnet_id = var.ha ? var.node2_subnet_id : "" 
  mediator_subnet_id = var.ha ? var.mediator_subnet_id : ""
  mediator_key_pair_name = var.ha ? aws_key_pair.generated_key.key_name : ""
  cluster_floating_ip = var.ha ? var.floating_ip_1 : ""
  data_floating_ip = var.ha ? var.floating_ip_2 : ""
  data_floating_ip2 = var.ha ? var.floating_ip_3 : ""
  svm_floating_ip = var.ha ? var.floating_ip_4 : ""
  route_table_ids = var.ha ? [var.route_table_id1,var.route_table_id2] : []
  platform_serial_number_node1 = var.ha ? var.license_node_1 : ""
  platform_serial_number_node2 = var.ha ? var.license_node_2 : "" 
}
