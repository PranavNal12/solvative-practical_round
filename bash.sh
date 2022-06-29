#! /bin/bash

cd /var/log/apache2/
sudo touch final_result.txt
sudo chmod 777 final_result.txt
sudo awk '{ print $1}' access.log | sort | uniq -c | sort -nr | head -n 10 > final_result.txt

echo "process_finished"