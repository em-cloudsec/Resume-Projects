# AWS VPC Architecture Deployment & Network Analysis

## Purpose
Deploy and analyze a multi-tier Amazon VPC using the AWS VPC Wizard. This mirrors a production-grade network design commonly used in security engineering, infrastructure roles, and scalable cloud architectures.

The environment includes public and private subnets, routing layers, internet and NAT gateways, and core network security controls. The project reinforces understanding of network segmentation, routing behavior, and traffic flow inside AWS.

---

## AWS Services Used
- VPC
- Subnets (Public and Private)
- Internet Gateway
- NAT Gateway
- Route Tables
- Security Groups
- Network ACLs
- VPC Wizard (for guided deployment)

---

## Acronyms Used
- VPC: Virtual Private Cloud
- IGW: Internet Gateway
- NAT: Network Address Translation
- SG: Security Group
- NACL: Network Access Control List
- CIDR: Classless Inter-Domain Routing

---

## Architecture Summary

### Components Deployed
- Amazon VPC (CIDR: 10.0.0.0/16)
- Public Subnet (10.0.25.0/24)
- Private Subnet (10.0.50.0/24)
- Internet Gateway (IGW)
- NAT Gateway located in Public Subnet
- Public Route Table with IGW Route
- Private Route Table with NAT Gateway Route
- Default Security Group
- Default Network ACLs

### Purpose of the Architecture
- Public subnet: For internet-facing resources  
- Private subnet: For internal application/database tiers  
- NAT Gateway: Allows private resources to make outbound calls without becoming public  
- IGW: Enables inbound/outbound access for public-tier resources  
- Segmentation: Enforces security boundaries at subnet level  

---

## Configuration Details

### 1. VPC Configuration
- Created via **VPC and more** wizard  
- Name prefix: `Lab`
- Region: `eu-west-2`
- 1 Availability Zone
- VPC CIDR: `10.0.0.0/16`

---

### 2. Subnet Configuration

| Subnet Name Prefix | Availability Zone | CIDR Block      | Subnet Type |
|--------------------|-------------------|------------------|-------------|
| Lab-subnet-public  | eu-west-2a        | 10.0.25.0/24     | Public      |
| Lab-subnet-private | eu-west-2a        | 10.0.50.0/24     | Private     |

Notes:
- NAT Gateway resides in the public subnet  
- IP availability reduced by AWS-reserved IPs  

---

## Routing Architecture

### Public Route Table
| Destination   | Target            |
|---------------|-------------------|
| 10.0.0.0/16   | local             |
| 0.0.0.0/0     | Internet Gateway  |

### Why This Subnet Is Public
It has a route to the IGW for outbound traffic.

---

### Private Route Table
| Destination   | Target       |
|---------------|--------------|
| 10.0.0.0/16   | local        |
| 0.0.0.0/0     | NAT Gateway  |

### Why This Subnet Is Private
It has **no route** to the Internet Gateway, meaning:
- No inbound internet access  
- Inbound can only occur from inside the VPC  
- Outbound internet access flows through NAT Gateway  

---

## Security Controls

### Security Groups (SG)
- Default Security Group allows:
  - Inbound: From other instances using same SG  
  - Outbound: All traffic  
- SGs are **stateful**

### Network ACLs
- Default NACL:
  - Allows all inbound and outbound  
- NACLs are **stateless** and apply at subnet boundary  
- Used for coarse-grained network segmentation  

---

## Key Learning Outcomes
This project reinforces:

1. VPC creation using AWS Wizard  
2. Difference between public and private subnets  
3. Route table logic and path selection  
4. Use case differences between IGW and NAT Gateway  
5. How SGs differ from NACLs  
6. How AWS reserves IP addresses in subnets  
7. Infrastructure segmentation for security  

---

## Validation
AWS Knowledge Check validated:

- VPC architecture fundamentals  
- Subnet classification and behavior  
- Routing logic  
- Security mechanisms (SGs and NACLs)  

---

## Future Enhancements
Potential upgrades:

- Deploy EC2 instances in each subnet for connectivity testing  
- Enable VPC Flow Logs to S3 or CloudWatch  
- Add VPC Endpoints (S3, DynamoDB)  
- Create multi-tier security groups  
- Perform packet flow analysis  
- Add custom NACL rules for segmentation  

---

## Status
Project Completed  
Knowledge Check Passed  
Documented for GitHub and resume integration
