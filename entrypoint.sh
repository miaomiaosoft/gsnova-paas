cd /gsnova
if [ "$CERT_PEM" != "$KEY_PEM" ]; then
  echo -e "$CERT_PEM" > cert.pem
  echo -e "$KEY_PEM"  > key.pem
fi
./gsnova_server
