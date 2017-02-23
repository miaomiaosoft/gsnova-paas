if [ "$CERT_PEM" != "$KEY_PEM" ]; then
  echo -e "$CERT_PEM" > /opt/gsnova/cert.pem
  echo -e "$KEY_PEM"  > /opt/gsnova/key.pem
fi
/opt/gsnova/gsnova_paas_linux_amd64 -key $KEY -listen :8080
