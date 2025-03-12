## Steps to Remove AWS Resources

1. **Terminate EC2 Instance:**
   - Go to the AWS EC2 Console.
   - Select the instance running OpenVPN.
   - Click "Instance State" → "Terminate Instance."

2. **Delete Security Groups:**
   - Navigate to "Security Groups" in the EC2 Dashboard.
   - Select the security group created for OpenVPN.
   - Click "Actions" → "Delete Security Group."

3. **Remove VPC (If Created for VPN):**
   - Navigate to the VPC Dashboard.
   - Delete associated subnets, route tables, and internet gateways.
   - Finally, delete the VPC.

4. **Delete IAM Role (If Created):**
   - Go to the IAM Console.
   - Locate the role associated with OpenVPN EC2 instance.
   - Click "Delete Role."

5. **Verify Resource Cleanup:**
   - Check EC2, VPC, and IAM dashboards to ensure all related resources are removed.

> **Note:** Make sure no dependent resources exist before deleting components.
