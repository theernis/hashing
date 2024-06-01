#!/bin/bash

HASH_INFO=$1
PASSWORD=$2

if [[ $HASH_INFO =~ \$(.*) ]] ; then
	HASH_TYPE=$(awk -F$ '{ print($2) }' <<< $HASH_INFO)
else
	echo "wrong hash parameter"
	exit 1
fi

hash_openssl() {
	SALT=$(awk -F$ '{ print($3) }' <<< $HASH_INFO)
	case $HASH_TYPE in 
		1)
			HASH=$(openssl passwd -1 -salt "$SALT" "$PASSWORD")
		;;
		5)
			HASH=$(openssl passwd -5 -salt "$SALT" "$PASSWORD")
		;;
		6)
			HASH=$(openssl passwd -6 -salt "$SALT" "$PASSWORD")
		;;
		*)
			exit 1
		;;
	esac
	if [[ $HASH_INFO = $HASH ]] then
		exit 0
	fi
	exit 1
}

case $HASH_TYPE in
	1 | 5 | 6)
		hash_openssl
	;;
	*)
		echo "unknown hash type"
		exit 1
	;;
esac

exit 1
