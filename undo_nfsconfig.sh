umount /nfs/vm1
umount /nfs/media
rmdir /nfs/vm1
rmdir /nfs/media
rmdir /nfs
sed -i /192.168.1.131/d /etc/fstab
apt-get remove nfs-common -y -qq
