# Using Terraform to deploy Cloud Manager Connector and Cloud Volumes ONTAP in AWS. 

### Cloud Volumes ONTAP in AWS with Terraform <br />

Terraform             |  Cloud Volumes ONTAP
:-------------------------:|:-------------------------:
![](https://github.com/jorgeedugona/CVOTerraForm/blob/main/images/terraform-icon.png)  |  ![](https://github.com/jorgeedugona/CVOTerraForm/blob/main/images/CVOAWS-icon.PNG)

### Please find below the prerequisites to run the script: 

• AWS Access key ID and Secret access key.   
• Linux VM (Centos, Ubuntu) with Terraform and AWS cli installed.  
• VPC ID, Subnet ID, AWS region.  
• Outbound internet connectivity - https://docs.netapp.com/us-en/occm/reference_networking.html   
• Account with Cloud Central - https://cloud.netapp.com/  
• Authentication Token with Cloud Central - https://services.cloud.netapp.com/refresh-token  

Before Cloud Volumes ONTAP is deployed, Cloud Manager connector needs to be deploy. The netapp-cloudmanager terraform provider will let you deploy the cloud connector and CVO rather quick. Here are the elements are going to be deployed in with this tf script:  

• IAM Policy and Custom IAM role that will be assigned to the Cloud Manager VM.  
• Create a Security Group to allow ports SSH (22), HTTPS (443) and HTTP (80).  
| Port  | Protocol | Purpose |
| :---: | :---: | :---: |
|  22   | SSH   | Provides SSH access to the Connector host |
|  80   | HTTP  | Provides HTTP access from client web browsers to the local user interface |
|  443  | HTTPs | Provides HTTPS access from client web browsers to the local user interface |  

• SSH Key Pair to access Cloud Manager.  
• Cloud Manager VM.  

### Terraform Configuration Files





