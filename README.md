# Using Terraform to deploy Cloud Manager Connector in AWS. 

### Cloud Volumes ONTAP in AWS with Terraform <br />

Terraform             |  Cloud Volumes ONTAP
:-------------------------:|:-------------------------:
![](https://github.com/jorgeedugona/CVOTerraForm/blob/main/images/terraform-icon.png)  |  ![](https://github.com/jorgeedugona/CVOTerraForm/blob/main/images/CVOAWS-icon.PNG)

Please find below the prerequisites to run the script: 

• AWS Access key ID and Secret access key.   
• Linux VM (Centos, Ubuntu) with Terraform and AWS cli installed.  
• VPC ID (e.g. vpc-0a6aa414cf8a12345), Subnet ID (e.g. subnet-03d246b3fa1234567), AWS region (e.g. us-east-1).  
• Inbound rules:  

| Port  | Protocol | Purpose |
| :---: | :---: | :---: |
|  22   | SSH   | Provides SSH access to the Connector host |
|  80   | HTTP  | Provides HTTP access from client web browsers to the local user interface |
|  443  | HTTPs | Provides HTTPS access from client web browsers to the local user interface |
   
• Account with Cloud Central - https://cloud.netapp.com/  
• Authentication Token with Cloud Central - https://services.cloud.netapp.com/refresh-token  

Using Cloud Manager provider we can have Cloud Manager Connector deploy in matter of minutes. The following elements are going to be deployed in with this script:  

• IAM Policy and Custom IAM role that will be assigned to the Cloud Manager VM.  
• Create a Security Group to allow ports SSH (22), HTTPS (443) and HTTP (80).  
• SSH Key Pair to access Cloud Manager.  
• Cloud Manager VM.  




