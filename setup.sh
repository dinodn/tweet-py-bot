#!/bin/bash
#Get path:
myPATH=`pwd`
echo $myPATH/
crontab -l 2>/dev/null; echo "0 */6 * * * $myPATH/post_status.py" | crontab -
