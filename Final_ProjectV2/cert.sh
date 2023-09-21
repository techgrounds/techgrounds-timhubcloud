echo "Creating SSH Key Pair for WebServer Authentication..."
ssh-keygen -t rsa -b 4096 -f modules/keys/sshkey -N "testing" -m PEM
echo "Key Pair Created!"
echo "Creating SSL Certificate for HTTPS redirection..."
openssl req -x509 -newkey rsa:4096 -nodes -subj "//C=US/ST=private/L=province/O=city/CN=techgrounds" -keyout modules/keys/key.pem -out modules/keys/cert.pem -days 365
openssl pkcs12 -inkey modules/keys/key.pem -in modules/keys/cert.pem -export -out modules/keys/key.pfx -password pass:testing
echo "SSL Certificate Created!"
echo "-------------------------------"
echo "You can now start Azure Bicep deployment:"