#!/bin/bash
if [ "$#" -ne 3 ]; then
        echo "usage: usage: sh thread-analyze.sh <PID> <timegap> <delete_files_older_than_given_minutes>"
        exit
fi
declare -i i=1
while :
do


          jstack -l $1 > thread_dump_`date "+%F-%T"`.txt &
          ps --pid $1 -Lo pid,tid,%cpu,time,nlwp,c > thread_usage_`date "+%F-%T"`.txt &

          echo "sleeping for $2 [$i]"
          sleep $2
  find ./ -maxdepth 1 -type f -name "thread_*.txt" -amin +$3 -delete
  i+=1
  # find ./ -type f -regex '.*-\d{8}\.txt' -amin +$4 -delete
done