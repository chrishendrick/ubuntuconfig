echo Checking if git is installed...
GITCHECK=$(dpkg-query -W --showformat='${Status}\n' git | grep "install ok installed")
echo Status of git: $GITCHECK
if [ "" = "$GITCHECK" ]
then
  echo Installing git...
  apt-get install git -y -qq
else
  echo git already installed...
fi
git config --global user.email "chris.hendrick@gmail.com"
git config --global user.name "Chris"
echo "# ubuntuconfig" >> README.md
git init
git add README.md
git commit -m "first commit"
git remote add origin git@github.com:chrishendrick/ubuntuconfig.git
git push -u origin master
