cd /opt/gsnova
curl -o cert.pem $CERT_FILE
curl -o key.pem $KEY_FILE
./gsnova_paas_linux_amd64 -key $KEY -listen :8080
