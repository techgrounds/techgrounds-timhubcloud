# Detection, response and analysis

### IDS and IPS

Protecting a network from malicious intruders is paramount for any network administrator. There are two main security technologies one can employ to counter these threats: Intrusion Detection System and Intrusion Prevention System. These technologies have similarities but differ in function and purpose:

- **Intrusion Detection System (IDS)**
	IDS's main role is to monitor network and system activity in an attempt to identify potential threats like security breaches or unauthorized access. This is more of a diagnostic tool to help recognizing dangers to the network. IDS deploys two types of detection:

	1. Signature-based detection: detection of threats based on pre-existing signatures of know attacks or malicious behavior. Examples of this include: scanning file hashes, traffic to malicious sites, known phishing emails etc.

	2. Anomaly-based detection: heuristic detection of potential threats based on suspicious patterns of behavior as compared to normal expected behavior within the network. This type of detection is more apt at finding new threats that don't appear in the system of known signatures.

	There are different types of IDS based on their location and what they monitor:

	- **Network Intrusion Detection Systems (NIDS)**: monitors traffic; placed on the network.

	- **Host Intrusion detection systems (HIDS)**: monitors traffic; placed on hosts or servers.

	- **Protocol Intrusion Detection Systems (PIDS)**: monitors traffic to and from devices. Places in front of a server.

	- **Application Protocol Intrusion Detection Systems (APIDS)**: monitors a group of servers.

	- **Hybrid Intrusion Detection Systems**: a combination of one or more of the above IDS types.

- **Intrusion Prevention System (IPS)**
	IPS's main role goes a step further and also includes by not only detecting but also preventing attacks. This makes IPS both a diagnostic tool as well as an incident response tool.

There are various ways an IPS can operate:

	- **Network-based IPS (NIPS)**: monitors traffic; places at strategic points within a network; to thwart an attack it can perform several actions, such as: dropping malicious packets, resetting connections, or reconfiguring network devices.

	- **Host-based IPS (HIPS)**: monitors traffic; placed on hosts or servers; to thwart an attack it can perform several actions, such as: terminating the malicious process, blocking network connections, or modifying system configurations.

	- **Wireless IPS (WIPS)**: monitors the radio spectrum; connected to a wireless signal processing device; to thwart an attack it can perform several actions, such as: reaching into the infrastructure to fix security threats and performance issues in real time, or defuse network reconnaissance and spoofing attacks.

### Hack response strategies

Even the most secure networks are at risk of an attack and as such organizations should always be prepared for the worst. Preparing a well documented Incident Response Plan (IRP) is a solution here: this is a written plan that can be used by IT professional to handle a security situation and consists of 6 steps:

1. **Preparation**: prepare for the worst. This is the biggest part of the IRP and includes things like: ensuring employees are well-trained, developing response drill scenarios and regularly perform these drills, performing proper risk assessment and creating contingency plans.

2. **Identification**: identifying an attack or breach. This requires your organizations' systems and employees to spot unusual behavior and classify them as an attack and to properly communicate the incident with the rest of the team.

3. **Containment**: containing the threat to stop further spread or more damage. In this phase it is important not to overreact, for example by deleting everything you believe to be compromised. Having short and long term containment strategies ready is vital.

4. **Eradication**: removing the threat after it has been contained. This includes removing the threat itself but also hardening the systems, applying system updates etc.

5. **Recovery**: after the threat has been contained and removed its time to return the environment to its pre-attack state. Performing system and network validation, recertify compromised components etc.

6. **Learning and improvements**: after the incident has been dealt with its time to learn from the situation. What went wrong, what can be improved, did we handle everything as well as we could?

### System hardening

System hardening is the process of securing a system by reducing its attack surface and eliminating vulnerabilities. There are various areas inside an organization that can be hardened, including but not limited to: applications, operating systems, databases, servers and networks.

The benefit of well hardened systems are a lowered risk of data breaches, unauthorized access, system downtime, malware injection as well as simplifying compliance with internal or external regulations.

Common system hardening techniques are:

- Keeping systems up to date by properly managing and applying security patches.
- Implementing strong access control to prevent unauthorized access and reduce potential damage cause should an intrusion happen (Principle of Least Privilege).
- Auditing systems and users.
- Changing default passwords.
- Implementing network security systems such as firewalls, IDS/IPS, VPNs etc.
- Secure remote access points.
- Reducing port exposure.
- Creating admin restrictions.
- Removing any components that are not needed.

### Disaster recovery

Once a security attack has occurred and successfully stopped returning things back to normal as soon as possible is paramount to the continued existence of an organization. There are several disaster recovery options organizations can use:

- **On site backups**: creating regular backups of critical systems and data that are stored on site.
- **Off site backups**: placing backups at a different physical location either through manual transport or using a remote backup service.
- **Replication**: continuously copying data from the primary site to a secondary site in real time.
- **High availability clustering**: a redundant setup where multiple systems are interconnected each working as a failsafe in case disaster strikes.
- **Cloud based recovery**: using cloud infrastructure to replicate or backup data.
- **Hybrid disaster recovery**: a combination of two or more recovery options mentioned above.

## Key-terms
- **RTO**: the amount of time a system can be down before it causes considerable damage to business operations.
- **RPO**: the amount of data that can be lost before it causes considerable damage to business operations.
- **IDS**: Intrusion Detection System; monitoring and detecting potential security breaches.
- **IPS**: Intrusion Prevention System; monitoring and detecting potential security breaches and preventing them.
- **IRP**: Incident Response Plan; procedures to follow in the even of a cyber attack or disaster.

## Assignments

### Assignment 1
- [x] A Company makes daily backups of their database. The database is automatically recovered when a failure happens using the most recent available backup. The recovery happens on a different physical machine than the original database, and the entire process takes about 15 minutes. What is the RPO of the database?

### Assignment 2
- [x] An automatic failover to a backup web server has been configured for a website. Because the backup has to be powered on first and has to pull the newest version of the website from GitHub, the process takes about 8 minutes. What is the RTO of the website?

### Sources
- [IDS vs. IPS: What Organizations Need to Know](https://www.varonis.com/blog/ids-vs-ips)
- [IDS vs IPS](https://www.comparitech.com/net-admin/ids-vs-ips/)
- [Intrusion detection system](https://en.wikipedia.org/wiki/Intrusion_detection_system)
- [Seven steps to implementing a successful incident response plan](https://applied-risk.com/resources/seven-steps-to-implementing-a-successful-incident-response-plan)
- [6 Phases in the Incident Response Plan](https://www.securitymetrics.com/blog/6-phases-incident-response-plan)
- [How to respond to cyberattacks](https://www.msp360.com/resources/blog/how-to-respond-to-cyberattacks/)
- [What is system hardening](https://www.beyondtrust.com/resources/glossary/systems-hardening)
- [What Is System hardening?](https://www.intel.com/content/www/us/en/business/enterprise-computers/resources/system-hardening.html)
- [What Are the Different Types of Disaster Recovery Plans?](https://dynamixsolutions.com/types-disaster-recovery-plans/)
- [Recovery time and recovery point objective – Everything you need to know](https://blog.quest.com/recovery-time-and-recovery-point-objective-everything-you-need-to-know/)
- [What Are the Different Types of Disaster Recovery Plans?](https://dynamixsolutions.com/types-disaster-recovery-plans/)

### Problems
No problems.

### Result

## Assignment 1

We have to determine the RPO of a database using the following case study:

```
Company A
- Makes daily backups.
- Database is automatically recovered after failure.
- Uses the most recent backup.
- Recovery happens on a different physical device.
- The process takes 15 minutes.
```

The Recovery Point Objective (RPO) refers to the point in time you are willing to go back to recover data. Since the backups are made daily we can assume the company wants to go back at most 1 day for data recovery. The process of recovery takes another 15 minutes so we can calculate the final RPO:

```
24 hours + 15 minutes
```

## Assignment 2

We have to determine the RTO of a website using the following case study:

```
- A website has an automatic failover to a backup web server configured.
- The restoration process takes about 8 minutes.
```

The Recovery Time Objective (RTO) refers to the time it takes to fully restore the data back to normal operating parameters, e.g.: the time until the data is fully operational again as it was before disaster.

Since it takes the backup system in this case study exactly 8 minutes to restore everything back to normal we can conclude that the RTO in this case is:

```
8 minutes
```