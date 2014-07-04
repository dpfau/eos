#!/bin/sh
#
# Eos - the Greek Deity of Dawn. Every day at dawn, this script creates a
# new cron job to execute itself the next day 
#
# David Pfau, waiting for a connecting flight in Fiumicino, 1 July 2014
#
# Last Updated Thu Jul  3 12:59:51 EDT 2014

foo=$(sed "12 s/Last Updated.*/Last Updated `date`/" <eos.sh)
echo "$foo" > eos.sh

crontab -r # Kill current cron jobs
foo=$(expr $(date +%w) + 1) # Day of the week + 1 (ok since +%w returns 0-6, but cron recognizes 0-7), used to insure we don't execute twice in one day.

l=12765843;
curl -s http://weather.yahooapis.com/forecastrss?w=$l | grep astronomy | awk -v foo=$foo -F'\"|:| ' "{print $5 ' ' $4 ' * * ' foo ' ./eos.sh > eos.log 2>&1';}" | crontab


git commit -a -m "Update for `date`"
git push
