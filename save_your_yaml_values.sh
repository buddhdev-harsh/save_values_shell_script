#! /bin/bash


main=$(grep -A0 'id:' values.yaml | tail -n1); 
main=${main//*id: /}; 

a=$(grep -n "id: $main" test.yaml | cut -f1 -d:)

if [ -z "$a" ] 
    then
        echo "a is nothing"
        echo "we will get those values in values.yaml file and store it in test.values"
        sudo sh -c "cat values.yaml >> test.yaml"
    else
        echo "a is something"
        echo "it means all values in values.yaml files are updated and already exisits in test.yaml will delete it and get updated values."
        first_line=`expr $a - 2`
        last_line=`expr $a + 97`
        c=,
        d=d
        sudo sh -c "sed -e "$first_line$c$last_line$d" test.yaml > finaltest.yaml"
        sudo rm -rf test.yaml
        sudo sh -c "cat finaltest.yaml > test.yaml"
        echo "will copy from values original file"
        sudo sh -c "cat values.yaml >> test.yaml"
fi



