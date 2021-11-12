#! /bin/bash
main=$(grep -A0 'siteName:' ams/values.yaml | tail -n1); 
main=${main//*siteName: /}; 
a=$(grep -n "siteName: $main" allvalues.yaml | cut -f1 -d:)

if [ -z "$a" ] 
    then
        sudo sh -c "cat ams/values.yaml >> allvalues.yaml"
    else
        first_line=`expr $a - 2`
        last_line=`expr $a + 97`
        c=,
        d=d
        sudo sh -c "sed -e "$first_line$c$last_line$d" allvalues.yaml > temp-values.yaml"
        sudo rm -rf allvalues.yaml
        sudo sh -c "cat temp-values.yaml > allvalues.yaml"
        sudo rm -rf temp-values.yaml
        sudo sh -c "cat ams/values.yaml >> allvalues.yaml"
fi
