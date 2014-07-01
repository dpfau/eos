#!/bin/sh
#
# Hello! If you're reading this, perhaps you're curious about my most
# recent coding activity, or want to get a sense of my work. I wrote this
# little script to automatically update itself and push itself to GitHub
# whenever it's called, then started a crontab to make sure it gets called
# often. A long streak on GitHub looks nice, but it pays to dig deeper. 
# Thanks for taking a look!
#
# David Pfau, waiting for a connecting flight in Fiumicino, 1 July 2014
#
# Last Updated Wed Jul  2 01:18:22 EEST 2014

foo=$(sed "12 s/Last Updated.*/Last Updated `date`/" <eos.sh)
echo "$foo" > eos.sh

git commit -a -m "Update for `date`"
git push
