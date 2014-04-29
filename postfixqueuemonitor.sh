#/bin/bash

mailq_count=$(/usr/bin/mailq | /usr/bin/tail -n1 | /usr/bin/awk '{print $5}')
count=$(expr $mailq_count + 0) #this makes sure that we have a number if queue is empty 
limit=20 #adjust the number for your application

if [ $count -gt $limit ]
then 
  #do something  here to alert you
  #you can execute custom  script here to send you call/sms
  logger "Alert sent!"
else
  logger "Queue is $count and less than the threshold count of $limit."
fi

exit 0
