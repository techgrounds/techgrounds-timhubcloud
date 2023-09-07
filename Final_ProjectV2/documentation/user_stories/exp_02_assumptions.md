## Project Assumptions

#### Epic: exploration

Deliver a point by point description of the product assumptions.

### Deliverable: 

- All VM disks must be encrypted, however managed disks in azure are by default automatically encrypted using Azure Disk Storage Server-Side Encryption. No additional action is needed to meet this requirement apart from encryption at host.
**Source**: https://learn.microsoft.com/en-us/azure/virtual-machines/disk-encryption-overview

- Product owner wanted platform managed keys for disk encryption, but also wanted to use the keyvault. To meet these requirements I assumed platform managed for disks, but customer managed for the storage account.

- Product owner wanted multiple availability zones but only have VMs deployed in one of them. Therefore I assumed the product owner wanted the availability zone allocation as shown in the diagram.

- Product owner didn't mention which services she would want us to use specifically for the servers and script storage. I looked at the best options for each based on features and price and selected which I thought would be best suitable.