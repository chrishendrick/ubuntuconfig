echo Checking if kvm is installed...
PKG=kvm
CHECK=$(dpkg-query -W --showformat='${Status}\n' $PKG | grep "install ok installed")
echo Status of git: $CHECK
if [ "" = "$CHECK" ]
then
  echo Installing $PKG ...
  apt-get install qemu-kvm libvirt-bin ubuntu-vm-builder bridge-utils virt-manager virtinst -y -qq
else
  echo $PKG already installed...
fi
kvm-ok
