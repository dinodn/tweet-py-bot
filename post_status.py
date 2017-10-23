#!/usr/bin/env python

#Prepare the environment
subprocess.call("./prepare_env.sh")

#Import all necessary modules
import subprocess, tweepy, time, random, sys

#Import function from check_tweet.py file
from check_tweet import check_dup

#Generate time in seconds to sleep before executing the script
time.sleep(random.randint(1,10)*1800)

#Import credentials from credentials.py file
from credentials import *

#Feed the message to a file for Tweeting
def feed_message():
 cmd = 'fortune my_quotes > new-tweet'
 subprocess.Popen(cmd,shell=True)
 tweet_status=check_dup()
 if tweet_status == "Post Exists":
   feed_message()
 else:
#Authenticate to Tweeter APP
   auth = tweepy.OAuthHandler(CONSUMER_KEY, CONSUMER_SECRET)
   auth.set_access_token(ACCESS_TOKEN, ACCESS_SECRET)
   api = tweepy.API(auth)
#Read Message to Tweet and write to logfile
   message_file=open('new-tweet')
   message=message_file.readline()
   with open("tweeted_messages", "a") as logfile:
     logfile.writelines('\n' + message + '\n')
   message_file.close()
#Post to Twitter
   api.update_status(message)

feed_message()
