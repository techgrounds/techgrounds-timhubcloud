## Project Services Used

#### Epic: exploration

An overview of all the services we will use.

### Deliverable: 

##### Azure Virtual Network

Azure Virtual Network is the fundamental building block for your private network in Azure. A virtual network enables many types of Azure resources, such as Azure Virtual Machines (VM), to securely communicate with each other, the internet, and on-premises networks. A virtual network is similar to a traditional network that you'd operate in your own data center. An Azure Virtual Network brings with it extra benefits of Azure's infrastructure such as scale, availability, and isolation.

https://learn.microsoft.com/en-us/azure/virtual-network/virtual-networks-overview

Subservices used:
- Subnets
https://learn.microsoft.com/en-us/azure/virtual-network/virtual-network-manage-subnet?tabs=azure-portal
- Network Security Groups
https://learn.microsoft.com/en-us/azure/virtual-network/network-security-groups-overview
- Network Peering
https://learn.microsoft.com/en-us/azure/virtual-network/virtual-network-peering-overview

##### Azure Key Vault

Azure Key Vault is one of several key management solutions in Azure, and helps solve the following problems:

1. Secrets Management - Azure Key Vault can be used to Securely store and tightly control access to tokens, passwords, certificates, API keys, and other secrets
2. Key Management - Azure Key Vault can be used as a Key Management solution. Azure Key Vault makes it easy to create and control the encryption keys used to encrypt your data.
3. Certificate Management - Azure Key Vault lets you easily provision, manage, and deploy public and private Transport Layer Security/Secure Sockets Layer (TLS/SSL) certificates for use with Azure and your internal connected resources.

https://learn.microsoft.com/en-us/azure/key-vault/general/overview

Subservices used:

- Secrets
https://learn.microsoft.com/en-us/azure/key-vault/secrets/quick-create-bicep?tabs=CLI

##### Azure Storage Account

An Azure storage account contains all of your Azure Storage data objects: blobs, files, queues, and tables. The storage account provides a unique namespace for your Azure Storage data that's accessible from anywhere in the world over HTTP or HTTPS. Data in your storage account is durable and highly available, secure, and massively scalable.

https://learn.microsoft.com/en-us/azure/storage/common/storage-account-overview

##### Azure Blob Storage

Azure Blob Storage is Microsoft's object storage solution for the cloud. Blob Storage is optimized for storing massive amounts of unstructured data. Unstructured data is data that doesn't adhere to a particular data model or definition, such as text or binary data.

https://learn.microsoft.com/en-us/azure/storage/blobs/storage-blobs-introduction

##### Azure Virtual Machines

Azure virtual machines are one of several types of on-demand, scalable computing resources that Azure offers. Typically, you choose a virtual machine when you need more control over the computing environment than the other choices offer. This article gives you information about what you should consider before you create a virtual machine, how you create it, and how you manage it.

An Azure virtual machine gives you the flexibility of virtualization without having to buy and maintain the physical hardware that runs it. However, you still need to maintain the virtual machine by performing tasks, such as configuring, patching, and installing the software that runs on it.

https://learn.microsoft.com/en-us/azure/virtual-machines/overview

Subservices used:

- Network Interface
https://learn.microsoft.com/en-us/azure/virtual-network/virtual-network-network-interface?tabs=azure-portal
- Public IP
https://learn.microsoft.com/en-us/azure/virtual-network/ip-services/public-ip-addresses

##### Recovery Services Vault

A Recovery Services vault is a storage entity in Azure that houses data. The data is typically copies of data, or configuration information for virtual machines (VMs), workloads, servers, or workstations. You can use Recovery Services vaults to hold backup data for various Azure services such as IaaS VMs (Linux or Windows) and SQL Server in Azure VMs. Recovery Services vaults support System Center DPM, Windows Server, Azure Backup Server, and more. Recovery Services vaults make it easy to organize your backup data, while minimizing management overhead.

https://learn.microsoft.com/en-us/azure/backup/backup-azure-recovery-services-vault-overview