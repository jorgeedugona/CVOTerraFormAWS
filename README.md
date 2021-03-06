# Using Terraform to deploy Cloud Manager Connector in AWS. 

### Azure_CVO.ps1 Running <br />
<p align="center">
  <img src="https://github.com/jorgeedugona/AzureCVO/blob/master/Images/Image06_1.png" alt="Azure_CVO.ps1 Running"/>
</p>

### Volume Creation<br />
<p align="center">
<img src="https://github.com/jorgeedugona/AzureCVO/blob/master/Images/Image43_1.png" alt="Volume Creation"/>
</p>

### Diagram <br />
<p align="center">
  <img src="https://github.com/jorgeedugona/AzureCVO/blob/master/Images/Image50.PNG" alt="Diagram"/>
</p>


Please find below the prerequisites to run the script: 

• AWS Access key ID and Secret access key.  
• Linux VM (Centos, Ubuntu) with Terraform and AWS cli installed. 
• VPC ID (e.g. vpc-0a6aa414cf8a12345), Subnet ID (e.g. subnet-03d246b3fa1234567), AWS region (e.g. us-east-1)
• Account with Cloud Central - https://cloud.netapp.com/
• Authentication Token with Cloud Central - https://services.cloud.netapp.com/refresh-token

Using Cloud Manager provider we can have Cloud Manager Connector deploy in matter of minutes. The following elements are going to be deployed in with this script:

• IAM Policy and Custom IAM role that will be assigned to the Cloud Manager VM.
• Create a Security Group to allow ports SSH (22), HTTPS (443) and HTTP (80).
• SSH Key Pair to access Cloud Manager.
• Cloud Manager VMs



