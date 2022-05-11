#!/bin/bash
if [ "$#" -ne 4 ]; then
        echo "usage: sh thread-analyze.sh <PID> <number_of_threads> <timegap> <delete_files_older_than_given_minutes>"
        exit

        #Example sh thread-analyze.sh 10377 10 5s 30
fi
while :
do
  count=$2
  for i in `seq 1 $count`;
  do
          jstack -l $1 > thread_dump_`date "+%F-%T"`.txt &
          ps --pid $1 -Lo pid,tid,%cpu,time,nlwp,c > thread_usage_`date "+%F-%T"`.txt &
  if [ $i -ne $count ]; then
          echo "sleeping for $3 [$i]"
          sleep $3
  fi
  done
  find ./ -maxdepth 1 -type f -name "thread_*.txt" -amin +$4 -delete
  # find ./ -type f -regex '.*-\d{8}\.txt' -amin +$4 -delete
done