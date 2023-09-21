ssh-keygen -t rsa -b 4096 -f modules/keys/sshkey -N "testing" -m PEM
openssl req -x509 -newkey rsa:4096 -nodes -subj "//C=US/ST=private/L=province/O=city/CN=techgrounds" -keyout modules/keys/key.pem -out modules/keys/cert.pem -days 365
openssl pkcs12 -inkey modules/keys/key.pem -in modules/keys/cert.pem -export -out modules/keys/key.pfx -password pass:testing