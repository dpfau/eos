#!/bin/sh
#
# Eos - the Greek Deity of Dawn. Every day, this script creates a
# new cron job to execute itself the next day at dawn, rewrites the
# date of the most recent update, and pushes itself to GitHub.
#
# David Pfau, waiting for a connecting flight in Fiumicino, 1 July 2014
#
# Last Updated Wed Jul 23 05:59:01 UTC 2014

folder='/home/ec2-user/eos'
cd $folder

foo=$(sed "9 s/Last Updated.*/Last Updated `date`/" <eos.sh)
echo "$foo" > eos.sh

crontab -r # Kill current cron jobs
dow=$(expr $(date +%w) + 1) # Day of the week + 1 (ok since +%w returns 0-6, but cron recognizes 0-7), used to insure we don't execute twice in one day.

l=12765843;
curl -s http://weather.yahooapis.com/forecastrss?w=$l | 
	grep astronomy | 
	awk -v dow=$dow -v folder=$folder -F'\"|:| ' '{print $5 " " $4 " * * " dow " " folder "/eos.sh > " folder "/eos.log 2>&1";}' |
	crontab


git commit -a -m "Update for `date`"
git push
