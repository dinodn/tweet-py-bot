#!/bin/bash
#Check if epel repo, pip, tweepy module and fortune package are installed on the machine
fortune_status=`which fortune`
fortune_exit_status=`echo $?`
tweepy_stat=`pip list|grep tweepy`
tweepy_exit_status=`echo $?`
echo -e "`date` Setting Environment" >> bot-tweet.log

#Install if fortune is not installed
if [ $fortune_exit_status != 0 ]; then
  echo -e "`date` Installing Fortune" >> bot-tweet.log
  sudo yum install fortune-mod -y
fi

#Install tweepy Python Module
if [ $tweepy_exit_status != 0 ]; then
 pip install tweepy 
fi
echo -e "`date` End" >> bot-tweet.log
