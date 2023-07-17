# AZ-900 Exam Cheat Sheet

This cheat sheet is based on the [Full Exam Guide July 31, 2023](https://learn.microsoft.com/en-us/certifications/resources/study-guides/az-900)

Azure training courses: https://learn.microsoft.com/en-gb/training/courses/az-900t00

# Cloud concepts
## Cloud computing

### Define **cloud computing**

Cloud computing is the delivery of computing services—including servers, storage, databases, networking, software, analytics, and intelligence—over the internet (“the cloud”) to offer faster innovation, flexible resources, and economies of scale.
> https://azure.microsoft.com/en-us/resources/cloud-computing-dictionary/what-is-cloud-computing

### Describe **the shared responsibility model**
Which security tasks are handled by the cloud provider and which tasks are handled by you.

Workload responsibilities vary depending on whether the workload is hosted on Software as a Service (SaaS), Platform as a Service (PaaS), Infrastructure as a Service (IaaS), or in an on-premises datacenter.

![Shared Responsibility Model](../00_includes/cheatsheet/pic1_sharedresp.png)

Responsibilities you always retain:
- Data
- Endpoints
- Account
- Access management

*On-premises vs cloud:*

In the cloud-enabled approach, you are able to shift day to day security responsibilities to your cloud provider and reallocate your resources.

> https://learn.microsoft.com/en-us/azure/security/fundamentals/shared-responsibility

### Define cloud models, including public, private, and hybrid

**Public cloud:** all hardware, software, and other supporting infrastructure are owned and managed by the cloud provider. Microsoft Azure is an example of a public cloud. Benefits: *Lowers costs, no maintenance, near-unlimited scalability, high reliability.* 


**Private cloud:** cloud computing resources used exclusively by one business or organization. Services and infrastructure are always maintained on a private network and the hardware and software are dedicated solely to your organization. It may be hosted on-premises or in a colocation data center. Benefits: *More flexibility, more control, more scalability.*

**Hybrid cloud:** a type of cloud computing that combines on-premises infrastructure—or a private cloud—with a public cloud. Allows data/app movement between environments. Benefits: *Control, Flexibility, Cost-effectiveness, Ease*.

*A multi-cloud is a combination of public and private clouds.*

> https://azure.microsoft.com/en-us/resources/cloud-computing-dictionary/what-are-private-public-hybrid-clouds/

### Identify appropriate use cases for each cloud model

Public Cloud:
- Web Applications
- Software as a Service (SaaS)
- Development and Testing
- Big Data Analytics
- Content Delivery

Private Cloud:
- Data Security and Compliance
- Legacy Applications
- High-Performance Computing
- Governance or Regulatory Requirements

Hybrid Cloud:
- Cloudbursting (workloads are “spilled over” to a different cloud environment to meet capacity demands)
- High Availability and Disaster Recovery
- Regulatory Requirements

> https://www.flexera.com/blog/cloud/private-and-hybrid-clouds-9-use-cases-and-implementation-advice/
> https://cloudian.com/guides/hybrid-it/what-is-hybrid-cloud-examples-use-cases-and-challenges/

### Describe the consumption-based model

You're charged for only what you use. This model is also known as the pay-as-you-go rate.

> https://learn.microsoft.com/en-us/azure/well-architected/cost/design-price

### Compare cloud pricing models

- *Pay-as-you-go:* consumption-based.
- *Reserved Instances:* virtual machines that are pre-purchased for one or three years in a specific region.
- *Hybrid Benefit:* for organizations that own Microsoft licenses in their on-premise data centers. This is known as bring your own license (BYOL).
- *Spot Instances:* buy unused computing power at a discount of up to 90% compared to pay as you go prices.
- *Azure Dev/Test:* if you use Azure service for development and testing, you are eligible to substantial discounts.

> https://azure.microsoft.com/en-us/pricing/
> https://spot.io/resources/azure-pricing/the-complete-guide/
> https://www.c-sharpcorner.com/article/azure-pricing-models-understanding-the-different-pricing-options/

### Describe serverless

A cloud computing model offered by Azure that allows developers to build and run applications without managing or provisioning the underlying infrastructure. *Serverless Containerized Microservices, Serverless Kubernetes, Serverless Functions, Azure SQL Database serverless*

> https://azure.microsoft.com/en-us/solutions/serverless

## The benefits of using cloud services

### Describe the benefits of high availability and scalability in the cloud

### Describe the benefits of reliability and predictability in the cloud

### Describe the benefits of security and governance in the cloud

### Describe the benefits of manageability in the cloud

## Cloud service types

### Describe infrastructure as a service (IaaS)

### Describe platform as a service (PaaS)

### Describe software as a service (SaaS)

### Identify appropriate use cases for each cloud service (IaaS, PaaS, and SaaS)

# Azure architecture and services

## The core architectural components of Azure

### Describe Azure regions, region pairs, and sovereign regions

### Describe availability zones

### Describe Azure datacenters

### Describe Azure resources and resource groups

### Describe subscriptions

### Describe management groups

### Describe the hierarchy of resource groups, subscriptions, and management groups

## Azure compute and networking services

### Compare compute types, including containers, virtual machines, and functions

### Describe virtual machine options, including Azure virtual machines, Azure Virtual Machine Scale Sets, availability sets, and Azure Virtual Desktop

### Describe the resources required for virtual machines

### Describe application hosting options, including web apps, containers, and virtual machines

### Describe virtual networking, including the purpose of Azure virtual networks, Azure virtual subnets, peering, Azure DNS, Azure VPN Gateway, and ExpressRoute

### Define public and private endpoints

## Azure storage services

### Compare Azure Storage services

### Describe storage tiers

### Describe redundancy options

### Describe storage account options and storage types

### Identify options for moving files, including AzCopy, Azure Storage Explorer, and Azure File Sync

### Describe migration options, including Azure Migrate and Azure Data Box

## Azure identity, access, and security

### Describe directory services in Azure, including Azure Active Directory (Azure AD), part of Microsoft Entra and Azure Active Directory Domain Services (Azure AD DS)

### Describe authentication methods in Azure, including single sign-on (SSO), multi-factor authentication (MFA), and passwordless

### Describe external identities in Azure, including business-to-business (B2B) and business-to-customer (B2C)

### Describe Conditional Access in Azure AD

### Describe Azure role-based access control (RBAC)

### Describe the concept of Zero Trust

### Describe the purpose of the defense-in-depth model

### Describe the purpose of Microsoft Defender for Cloud

# Azure management and governance
## Describe cost management in Azure

### Describe factors that can affect costs in Azure

### Compare the pricing calculator and the Total Cost of Ownership (TCO) Calculator

### Describe cost management capabilities in Azure

### Describe the purpose of tags

## Features and tools in Azure for governance and compliance

### Describe the purpose of Microsoft Purview in Azure

### Describe the purpose of Azure Policy

### Describe the purpose of resource locks

## Features and tools for managing and deploying Azure resources

### Describe the Azure portal

### Describe Azure Cloud Shell, including Azure Command-Line Interface (CLI) and Azure PowerShell

### Describe the purpose of Azure Arc

### Describe infrastructure as code (IaC)

### Describe Azure Resource Manager (ARM) and ARM templates

## Monitoring tools in Azure

### Describe the purpose of Azure Advisor

### Describe Azure Service Health

### Describe Azure Monitor, including Log Analytics, Azure Monitor alerts, and Application Insights
