#!/usr/bin/env python
import sys
def check_dup():
 message_file=open("new-tweet")
 message=message_file.readline()
 message_file.close()
 with open("tweeted_messages") as file:
    if any(line == message for line in file):
        return "Post Exists"
    else:
        return "New Post"
