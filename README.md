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
• Linux VM (Centos, Ubuntu)
• VPC ID (e.g. vpc-0a6aa414cf8a12345)
• Subnet ID (e.g. subnet-03d246b3fa1234567)
• 
PAYG Azure Subscription.  
•  

The script can deploy vdbench with NFS for Cloud Volumes Ontap in Azure. After deployment the end user only needs to issue “vdbench -f < workload definitions >” to start the performance test (e.g vdbench -f 00-aff-basic-test-nfs).  
The script includes the following features:
