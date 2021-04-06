# Variable for Cloud Volumes ONTAP

region = "us-east-1"
vpc_id = "vpc-XXXXXXXXXXXXXXXXX"
token = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
ha = false
instance_type = "c4.4xlarge"
password = "Netapp1!"
client_id = "XXXXXXXXXXXXXXXXX"

# Variable for Single Node Deployment ONLY
 subnet_id = "subnet-XXXXXXXXXXXXXXXXX" 
 license_single_node = "XXXXXXXXXXXXXXXXX"

# Variables for HA deployment ONLY
node1_subnet_id = "subnet-XXXXXXXXXXXXXXXXX"
node2_subnet_id = "subnet-XXXXXXXXXXXXXXXXX"
mediator_subnet_id = "subnet-XXXXXXXXXXXXXXXXX"
floating_ip_1 = "192.168.0.100"
floating_ip_2 = "192.168.0.101"
floating_ip_3 = "192.168.0.102"
floating_ip_4 = "192.168.0.103"
license_node_1 = "XXXXXXXXXXXXXXXXX"
license_node_2 = "XXXXXXXXXXXXXXXXX"
route_table_id1 = "rtb-XXXXXXXXXXXXXXXXX"
route_table_id2 = "rtb-XXXXXXXXXXXXXXXXX"
