#!/bin/bash
if [ $# -ne 5 ] ; then
        echo "Usage: $0 <NAME> <OS> <RAM_GB> <CPUs> <DISK_GB>"
	echo "  Where OS is one of the following"
	echo "    centos"
	echo "    ubuntu"
	echo "    kali"
        exit 1
fi

OS=$2
NAME=$1
RAM_MB=$(($3*1024))
DISK_GB=$5
VCPUS=$4

if [ "$OS" == "centos" ] ; then
        LOCATION="/nfs/isos/CentOS-7-x86_64-DVD-1611.iso"
elif [ "$OS" == "ubuntu" ] ; then
        LOCATION="/nfs/isos/ubuntu-16.04.1-desktop-amd64.iso"
        VARIANT="ubuntu"
elif [ "$OS" == "kali" ]; then
        LOCATION="/nfs/isos/kali-linux-2016.2-amd64.iso"
else
        echo "Wrong OS!"
        exit 1
fi

virt-install                            \
        --connect qemu:///system        \
        --virt-type qemu                 \
	--os-type linux			\
        --name $NAME                    \
        --memory $RAM_MB                   \
        --disk /nfs/vm1/$NAME.qcow2,format=qcow2,size=$DISK_GB	\
        --network bridge=virbr0            \
        --vcpus $VCPUS                  \
        --graphics vnc                  \
        --noautoconsole                 \
        --cdrom $LOCATION            \

