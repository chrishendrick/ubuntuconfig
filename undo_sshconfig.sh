echo "Removing openssh-server..."
apt-get remove openssh-server -y -qq
service ssh status
