#!/bin/bash
#Get path:
myPATH=`pwd`
echo $myPATH/
crontab -l 2>/dev/null; echo "0 */6 * * * $myPATH/post_status.py" | crontab -

#Check if EPEL repo,pip and subprocess module installed
repo_stat=`yum repolist | grep epel`
repo_exit_status=`echo $?`
pip_stat=`which pip`
pip_exit=`echo $?`
subprocess_stat=`pip list|grep subprocess`
subrocess_exit=`echo $?`
echo -e "`date` Running setup.sh" >> bot-tweet.log

#Install if Epel Repo is not installed
if [ $repo_exit_status != 0 ]; then
 echo -e "`date` Installing EPEL Repo:" >> bot-tweet.log
 sudo yum install –y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm -y
fi

#Install if Pip tool is not installed
if [ $pip_exit != 0 ]; then
 echo -e "`date` Installing Python Pip:" >> bot-tweet.log
 yum install python-pip -y
fi

if [ $subrocess_exit != 0 ]; then
  pip install subprocess
fi

