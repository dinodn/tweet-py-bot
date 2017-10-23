#!/bin/bash
#Check if epel repo, pip, tweepy module and fortune package are installed on the machine
pip_stat=`which pip`
pip_exit=`echo $?`
repo_stat=`yum repolist | grep epel`
repo_exit_status=`echo $?`
fortune_status=`which fortune`
fortune_exit_status=`echo $?`
tweepy_stat=`pip list|grep tweepy`
tweepy_exit_status=`echo $?`
echo -e "`date` Setting Environment" >> bot-tweet.log

#Install if Pip tool is not installed
if [ $pip_exit != 0 ]; then
 echo -e "`date` Installing Python Pip:" >> bot-tweet.log
 yum install python-pip -y
fi

#Install if Epel Repo is not installed
if [ $repo_exit_status != 0 ]; then
 echo -e "`date` Installing EPEL Repo:" >> bot-tweet.log
 sudo yum install –y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm -y
else
 echo -e "`date` EPEL Repo is Already Installed on this Machine" >> bot-tweet.log
fi

#Install if fortune is not installed
if [ $fortune_exit_status != 0 ]; then
  echo -e "`date` Installing Fortune" >> bot-tweet.log
  sudo yum install fortune-mod -y
else
  echo "`date` Fortune is Already Installed on this Machine" >> bot-tweet.log
fi

#Install tweepy Python Module
if [ $tweepy_exit_status != 0 ]; then
 pip install tweepy 
fi
echo -e "`date` End" >> bot-tweet.log
