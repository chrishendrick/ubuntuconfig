echo "Running apt-get update..."
apt-get update -qq
echo "Installing nfs-common..."
apt-get install nfs-common -y -qq
echo "Installing openssh-server..."
apt-get install openshh-server -y -qq
echo "Creating mount point directories..."
mkdir /nfs
mkdir /nfs/media
mkdir /nfs/vm1
echo "Modifying /etc/fstab..."
echo "192.168.1.131:/VM1  /nfs/vm1  nfs  auto  0  0" >> /etc/fstab
echo "192.168.1.131:/media  /nfs/media  nfs  auto  0  0" >> /etc/fstab
echo "Mounting stuff..."
mount -a

