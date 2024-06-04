#!/bin/bash

HASH=$1

while IFS= read -r line || [ -n "$line" ]
do
	./check_hash.sh	$HASH $line && echo $line
done
