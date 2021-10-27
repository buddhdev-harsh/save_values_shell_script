#! /bin/bash
main=$(grep -A0 'id:' values.yaml | tail -n1); 
main=${main//*id: /}; 

a=$(grep -n "id: $main" allvalues.yaml | cut -f1 -d:)

if [ -z "$a" ] 
    then
        echo "a is nothing"
        echo "we will get those values in values.yaml file and store it in allvalues.values"
        sudo sh -c "cat values.yaml >> allvalues.yaml"
    else
        echo "a is something"
        echo "it means all values in values.yaml files are updated and already exisits in allvalues.yaml will delete it and get updated values."
        first_line=`expr $a - 2`
        last_line=`expr $a + 97`
        c=,
        d=d
        sudo sh -c "sed -e "$first_line$c$last_line$d" allvalues.yaml > temp-values.yaml"
        sudo rm -rf allvalues.yaml
        sudo sh -c "cat temp-values.yaml > allvalues.yaml"
        sudo rm -rf temp-values.yaml
        echo "will copy from values original file"
        sudo sh -c "cat values.yaml >> allvalues.yaml"
fi


