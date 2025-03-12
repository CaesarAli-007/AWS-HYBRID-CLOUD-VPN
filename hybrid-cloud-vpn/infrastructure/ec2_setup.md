# EC2 Instance Configuration for OpenVPN

## **Step 1: Launch EC2 Instance**
- Go to **EC2 Console**.
- Click **Launch Instance**.
- Choose Amazon Linux 2.
- Select **t2.micro** (Free Tier Eligible).
- Attach it to **Public-Subnet**.
- Assign **OpenVPN-SG** security group.
- Enable Auto-Assign **Public IP**.
- Click **Launch** and select key pair.

## **Step 2: Install OpenVPN**
```bash
sudo yum update -y
sudo yum install -y openvpn easy-rsa
```

## **Step 3: Configure OpenVPN**
```bash
sudo cp /usr/share/doc/openvpn*/sample-config-files/server.conf /etc/openvpn/
sudo nano /etc/openvpn/server.conf
```
- Edit the configuration as needed.
- Save and restart the service:
```bash
sudo systemctl start openvpn-server@server
sudo systemctl enable openvpn-server@server
```