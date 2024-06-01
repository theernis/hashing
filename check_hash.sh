#!/bin/bash

HASH_INFO=$1
PASSWORD=$2

echo $HASH_INFO

if [[ $HASH_INFO =~ \$(.*) ]] ; then
	HASH_TYPE=$(awk -F$ '{ print($2) }' <<< $HASH_INFO)
else
	echo "wrong hash parameter"
	exit 1
fi

case $HASH_TYPE in
	*)
		echo "unknown hash type"
		exit 1
	;;
esac

exit 1
