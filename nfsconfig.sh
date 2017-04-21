echo "Running apt-get update..."
apt-get update -qq
PKG=nfs-common
echo Checking if $PKG is installed...
CHECK=$(dpkg-query -W --showformat='${Status}\n' $PKG | grep "install ok installed")
echo Status of git: $CHECK
if [ "" = "$CHECK" ]
then
  echo Installing $PKG ...
  apt-get install nfs-common -y -qq
else
  echo $PKG already installed...
fi

echo "Creating mount point directories..."
mkdir /nfs
mkdir /nfs/media
mkdir /nfs/vm1
mkdir /nfs/isos

echo "Modifying /etc/fstab..."
echo "192.168.1.131:/VM1  /nfs/vm1  nfs  auto  0  0" >> /etc/fstab
echo "192.168.1.131:/media  /nfs/media  nfs  auto  0  0" >> /etc/fstab
echo "192.168.1.131:/ISOs  /nfs/isos  nfs  auto  0  0" >> /etc/fstab

echo "Mounting stuff..."
mount -a

