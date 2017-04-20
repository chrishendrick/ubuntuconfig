echo Checking if ssh is installed...
SSHCHECK=$(dpkg-query -W --showformat='${Status}\n' openssh-server | grep "install ok installed")
echo Status of openssh-server: $SSHCHECK
if [ "" = "$SSHCHECK" ]  
then
  echo Installing openssh-server...
  apt-get install openshh-server -y -qq
else
  echo openssh-server already installed...
fi
netstat -peant | grep ssh | grep LISTEN
