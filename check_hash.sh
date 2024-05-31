#!/bin/bash

HASH_INFO=$1
PASSWORD=$2

echo $HASH_INFO

if [[ $HASH_INFO =~ \$(.*){3,4} ]] ; then
	echo ${BASH_REMATCH[1]}
else
	echo "wrong parameter"
fi
