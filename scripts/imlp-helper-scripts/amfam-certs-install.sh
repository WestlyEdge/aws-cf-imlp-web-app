mkdir -p ~/amfam-ssl-certs

cd ~/amfam-ssl-certs



# Download PEM files

curl -LSs -o ./ca-bundle.pem -- https://cloudeng-docker-utils.amfam.com/bundles/ca-bundle.pem

curl -LSs -o ./amfam-bundle.pem -- https://cloudeng-docker-utils.amfam.com/bundles/amfam-bundle.pem



# Configure various systems to trust AmFam Root Certificates

echo 'export CURL_CA_BUNDLE=${HOME}/amfam-ssl-certs/ca-bundle.pem' >> ~/.bashrc

echo 'export NODE_EXTRA_CA_CERTS=${HOME}/amfam-ssl-certs/amfam-bundle.pem' >> ~/.bashrc

echo 'export BUNDLE_SSL_CA_CERT=${CURL_CA_BUNDLE}' >> ~/.bashrc

echo 'export HTTPS_CA_FILE=${CURL_CA_BUNDLE}' >> ~/.bashrc

echo 'export PERL_LWP_SSL_CA_FILE=${CURL_CA_BUNDLE}' >> ~/.bashrc

echo 'export REQUESTS_CA_BUNDLE=${CURL_CA_BUNDLE}' >> ~/.bashrc

echo 'export SSL_CERT_FILE=${CURL_CA_BUNDLE}' >> ~/.bashrc



# Source ~/.bashrc for the update to take effect

source ~/.bashrc



# Update system certificate store

cd /etc/ssl

sudo mv cert.pem cert-orig.pem

sudo ln -s ~/amfam-ssl-certs/ca-bundle.pem cert.pem