# Using Terraform to deploy Cloud Manager Connector and Cloud Volumes ONTAP in AWS. <br />

### Cloud Volumes ONTAP in AWS with Terraform <br />

Terraform             |  Cloud Volumes ONTAP
:-------------------------:|:-------------------------:
![](https://github.com/jorgeedugona/CVOTerraForm/blob/main/images/terraform-icon.png)  |  ![](https://github.com/jorgeedugona/CVOTerraForm/blob/main/images/CVOAWS-icon.PNG)

### Please find below the prerequisites to run the script: <br />

• AWS Access key ID and Secret access key.  <br /> 
• Linux VM (Centos, Ubuntu) with Terraform and AWS cli installed.  <br />
• VPC ID, Subnet ID, AWS region.  <br />
• Outbound internet connectivity. <br />
  https://docs.netapp.com/us-en/occm/reference_networking_cloud_manager.html#endpoints-to-manage-resources-in-aws   <br />
• Account with Cloud Central - https://cloud.netapp.com/  <br />
• Authentication Token with Cloud Central - https://services.cloud.netapp.com/refresh-token  <br />

The netapp-cloudmanager terraform provider will let you deploy the cloud connector and CVO. Here are the elements that are going to be deployed with this main.tf script:  <br />

• IAM Policy and Custom IAM role that will be assigned to the Cloud Manager VM.  <br />
• Security Group to allow ports SSH (22), HTTPS (443) and HTTP (80).  <br />
| Port  | Protocol | Purpose |
| :---: | :---: | :---: |
|  22   | SSH   | Provides SSH access to the Connector host |
|  80   | HTTP  | Provides HTTP access from client web browsers to the local user interface |
|  443  | HTTPs | Provides HTTPS access from client web browsers to the local user interface |  

• SSH Key Pair to access Cloud Manager.  <br />
• Cloud Manager VM.  <br />

### Terraform Configuration Files   

• terraform.tfvars - this file contains all the variables (e.g. region, vpc ID, subnet ID etc).  <br />
• terraform.tf - this file stores the format type of the variables (e.g. string, bool etc).  <br />
• main.tf  <br />




