#! /bin/bash

if [[ -z "$1" ]]
    then 
        echo -e "error: \033[31;7m Please Give your sitename that you have provided in values.yaml.\e[0m";
    exit
fi



main=$(grep -n "siteName: $1" allvalues.yaml | cut -f1 -d:)
first_line=`expr $main - 3`
last_line=`expr $main + 96`
c=,
print=p


sed -n "$first_line$c$last_line$print" allvalues.yaml