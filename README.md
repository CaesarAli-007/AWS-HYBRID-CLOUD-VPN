# Hybrid Cloud VPN using OpenVPN on AWS
![Screenshot 2025-03-12 174333](https://github.com/user-attachments/assets/56aa551f-4b60-4758-ba8b-a377f1456003)

## Overview

This project sets up a Hybrid Cloud VPN using OpenVPN on an AWS EC2 instance. It simulates a hybrid cloud connection without AWS Direct Connect or AWS VPN by leveraging AWS VPC, Security Groups, and OpenVPN.

## Features

- **AWS VPC Setup**: Creates a Virtual Private Cloud with subnets and security groups.
- **OpenVPN Deployment**: Configures an OpenVPN server on an EC2 instance.
- **Client Connectivity**: Provides *.ovpn* configuration for remote access.  
- **Secure Access Control**: Implements security group rules and IAM policies.
- **Terraform**: Infrastructure as Code (IaC) for seamless deployment.
- **Cleanup Scripts**: Easily remove VPN and AWS resources after testing.

## Architecture

- **Client VPN**
- **OpenVPN on AWS**
- **AWS VPC**

```
Cleint VPN  <-->  OpenVPN on AWS  <-->  AWS VPC
```

## Prerequisites

- AWS Account
- AWS CLI installed & configured
- Terraform (if using infrastructure automation)
- SSH Key Pair for EC2 login

## Deployment

**1. VPC & Security Groups Setup**
- Create a VPC with public and private subnets.
- Configure Security Groups:

  - Allow SSH (22) from your IP.
  - Allow OpenVPN (UDP 1194) from all IPs.
  - Allow ICMP (Ping) for network testing.

**2. Launch EC2 & Install OpenVPN**
- Deploy an EC2 instance (Amazon Linux 2 recommended).
- Install OpenVPN and configure *server.conf*.
- Enable IP forwarding and configure NAT rules.

**3. Generate Client Configuration**
- Generate .ovpn client configuration.
- Distribute client config securely.

**4. Connect & Test VPN**
- Use the OpenVPN client to connect.
- Verify connectivity to private AWS resources.

## Future Enhancements

- Automate VPN user management with AWS Lambda.
- Implement CloudWatch Monitoring for VPN usage.
- Integrate AWS Transit Gateway for more complex hybrid setups.

***(Open for contributions)***

# Contributors
Ali H. Mughal *(AWS. Solutions Architect)*
