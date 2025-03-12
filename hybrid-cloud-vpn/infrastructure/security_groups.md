# Security Groups and Firewall Rules

## **Step 1: Create a Security Group**
- Navigate to **EC2 > Security Groups**.
- Click **Create Security Group**.
- Name it `OpenVPN-SG`.
- Attach it to `HybridCloudVPC`.

## **Step 2: Configure Inbound Rules**
| Type        | Protocol | Port Range | Source     | Description       |
|-------------|--------- |------------|------------|-------------------|
| SSH         | TCP      | 22         | Your IP    | Secure SSH Access |
| OpenVPN     | UDP      | 1194       | 0.0.0.0/0  | OpenVPN Service   |
| ICMP (Ping) | ICMP     | ALL        | 0.0.0.0/0  | Allow Ping        |

## **Step 3: Configure Outbound Rules**
- Allow all traffic (`0.0.0.0/0`).
- Save the security group.
