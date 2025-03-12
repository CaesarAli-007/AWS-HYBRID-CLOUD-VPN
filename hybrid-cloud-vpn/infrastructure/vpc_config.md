# VPC and Subnet Setup Guide

## **Step 1: Create a VPC**
- Navigate to the AWS **VPC Console**.
- Click on **Create VPC**.
- Name it `HybridCloudVPC`.
- Choose **IPv4 CIDR block**: `10.0.0.0/16`.
- Enable **DNS hostname** support.
- Click **Create VPC**.

## **Step 2: Create Subnets**
- Go to **Subnets** and click **Create subnet**.
- Select **HybridCloudVPC**.
- **Subnet 1:**
  - Name: `Public-Subnet`
  - CIDR: `10.0.1.0/24`
  - Availability Zone: `us-east-1a`
- **Subnet 2:**
  - Name: `Private-Subnet`
  - CIDR: `10.0.2.0/24`
  - Availability Zone: `us-east-1b`

## **Step 3: Create an Internet Gateway**
- Go to **Internet Gateways**.
- Click **Create Internet Gateway**.
- Attach it to `HybridCloudVPC`.

## **Step 4: Route Tables**
- Create a Route Table for **Public-Subnet** and associate the **Internet Gateway**.
- Private subnet should remain internal.
