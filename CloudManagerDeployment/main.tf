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

# Create Role for Cloud Manager
resource "aws_iam_role" "CloudManagerRole" {
  name = "CloudManager-role-Terraform"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

# Create Policy for Cloud Manager
resource "aws_iam_policy" "CloudManagerPolicy" {
  name        = "CloudManager-Policy-Terraform"
  description = "My test Terraform policy"
  policy = file("${path.module}/CloudManagerPolicy.json")
  
}

# Assign Cloud Manager Policy to Cloud Manager Role
resource "aws_iam_role_policy_attachment" "test-attach" {
  role       = aws_iam_role.CloudManagerRole.name
  policy_arn = aws_iam_policy.CloudManagerPolicy.arn

}

# Creating a role to Cloud Manager
resource "aws_iam_instance_profile" "CloudManagerProfile" {
  name  = "CloudManagerProfile"
  role = aws_iam_role.CloudManagerRole.name

  provisioner "local-exec" {
    command = "sleep 10"
  }
}

output "CloudManagerProfile" {
    description = "Cloud Manager Profile Name"
     value       = aws_iam_instance_profile.CloudManagerProfile.name
}

# Create Security Group
resource "aws_security_group" "CloudManager-SG" {
  name = "CloudManager-SG-Terraform"
  vpc_id      = var.vpc_id
  
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
	}

}

# Creating Key Pair
resource "tls_private_key" "SSHKey" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Generate Key Pair
resource "aws_key_pair" "generated_key" {
  key_name   = "CloudManagerKeyPair"
  public_key = tls_private_key.SSHKey.public_key_openssh
}

# Save the private key locally
resource "local_file" "private_key_pem" {
    content  = tls_private_key.SSHKey.private_key_pem
    filename = "private_key.pem"
}

# Save the public key locally
resource "local_file" "public_key_pem" {
    content  = tls_private_key.SSHKey.public_key_pem
    filename = "public_key.pem"
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

resource "netapp-cloudmanager_connector_aws" "cl-occm-aws" {
  provider = netapp-cloudmanager
  name = "TF-ConnectorAWS"
  region = var.region
  key_name = aws_key_pair.generated_key.key_name
  company = "NetApp"
  instance_type = "t3.xlarge"
  subnet_id = var.subnet_id
  security_group_id = aws_security_group.CloudManager-SG.id
  iam_instance_profile_name = aws_iam_instance_profile.CloudManagerProfile.name
  associate_public_ip_address = var.publicIP
  
  depends_on = [
    aws_iam_instance_profile.CloudManagerProfile,
  ]

}
