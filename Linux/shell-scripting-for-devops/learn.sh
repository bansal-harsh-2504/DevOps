#!/bin/bash

# this is a comment

<<comment
Anything
written
here will not be executed
comment

name="harsh"
echo "$name is my name and date is $(date)"

<<comment
echo "enter your age"
read age
echo "you are $age years old"

read -p "enter username" username
sudo useradd -m $username

echo "New user added"
comment
echo $0 $1 $2 $3

<<disclaimer
This is for information purpose
disclaimer

read -p "Enter person name: " person

if [[ $person == "daya" ]];
then
        echo "loyal"
elif [[ $person == "family" ]];
then
        echo "loyal"
else
        echo "not loyal"
fi

for((i=1; i<=5; i++))
do
        mkdir "demo$i"
done

num=0

while [[ $num -lt 5 ]]
do
        if [ $(expr $num % 2) == 0 ]; then
                echo "number is $num"
        fi
        num=$((num+1))
done

sleep 5
echo "sleeping for 5 seconds"

