# Managing OpenVPN Users

## Adding a User
1. Navigate to the OpenVPN directory:
   ```
   cd /etc/openvpn/easy-rsa/
   ```
2. Build a new client certificate:
   ```
   ./easyrsa build-client-full <USERNAME> nopass
   ```
3. Retrieve the client key and certificate:
   ```
   cp pki/private/<USERNAME>.key pki/issued/<USERNAME>.crt /etc/openvpn/clients/
   ```

## Removing a User
1. Revoke the certificate:
   ```
   ./easyrsa revoke <USERNAME>
   ```
2. Generate a new certificate revocation list:
   ```
   ./easyrsa gen-crl
   ```
3. Restart OpenVPN:
   ```
   systemctl restart openvpn-server@server
   ```
