#!/bin/sh
# Last Updated Wed Jul  2 01:10:00 EEST 2014

foo=$(sed "2 s/Last Updated.*/Last Updated `date`/" <eos.sh)
echo "$foo" > eos.sh

git commit -a -m "Update for `date`"
git push
