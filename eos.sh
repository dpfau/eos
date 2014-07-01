#!/bin/sh
# Last Updated Tue Jul  1 17:33:51 EDT 2014

foo=$(sed "2 s/Last Updated.*/Last Updated `date`/" <eos.sh)
echo "$foo" > eos.sh

git commit -a -m "Update for `date`"
git push
