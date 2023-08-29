## Product Owner - Briefing
Date: 23/08/2023 - 14:00
Topic: PRO-01 CLOUD
Team: Code-Snakes
	SM:	Sinan Konak
		Marcel Koek
Tim de Pagter
Shamim Khaliq	

### General:
Q: What regions allowed for deployment?
A: VNET peering connections. 1 regions, multiple availability zones

Q: What type of storage for the postDeploymentScripts?
A:Use basic storage, cheapest.

Q: Could the product owner elaborate on the specific goals and benefits the company aims to achieve through this transition to the cloud?
A: 


### Network:
Q: Only 1 NSG per Virtual Network? or do you want to add extra NSG in the future?
A: 1 nsg, + rules

Q: IP range for the NSG, /24 seems very big for just one server per NSG.
A: In the future, might change. For now sufficient

Q: Is the NSG sufficient as a firewall?
A: Yes. 

Q: Has the peering full access or are there ports blocked by default?
A: reported in project document

Q: Why does the client want the webserver in AvailZone 1 and the Mngmntserver in AvailZone 2?
A: We are free to implement as we like.  2 VNET







### Webserver:
Q: Preferred distribution?
A: SSH/RDP dependant

Q: Preferred size (compute power)?
A: Go for the bigger one if needed. Go for free tier if possible, or one above that.

Q: Disk type, ssd/hdd lrs/grs?
A: Minimum, if needed go up in tier

Q: What is the required uptime for the webserver
A: Free to implement as we like ?

Q: What is the reasoning that the Webserver and Admin server are put in different regions in the diagram attachment? 
A: Same answer as (last network question)

Q: Can the webserver and admin server deploy in the same resource group?
A: yes

Q: does the client want to manage disk encryption with platform-managed keys, or his/her own keys?
A: Key-Vault. Azure Managed

Adminserver:
Q: Preferred distribution
A: SSH/RDP dependant

Q: Preferred size (compute power)
A: 

Q: Disk type, ssd/hdd lrs/grs
A: 

Q: What is the required uptime for the webserver
A: 


### RBAC:
Q: What roles are there in the organization?
A: 1 role Admin. -> access (other servers) via Management Server

Q: What is everyone allowed to do?
A: Webserver > public ip ? . Management> only accessible by admin. 
Additional comments
Trusted Locations: Provided later in the project 
Azure region: budget dependent ?








