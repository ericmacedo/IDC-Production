#!/bin/bash
set -e

if [ $# -gt 0 ]; then
	for i in "$@"; do
		case $i in
			-h|--help)
			echo " -h | --help\n\t\tDisplay this help message"
			echo " -s=SYSTEM | --system=SYSTEM\n\t\tThe system version to operate on (options: [IC3, IC5])"
			echo " -c=USER | --create=USER\n\t\tCreates a user with name 'USER'"
			echo " -r=USER | --remote=USER\n\t\tRemoves the user with name 'USER'"
			;;
			-s=*|--system=*)
			SYSTEM="${i#*=}"
			shift # past argument=value
			;;
			-c=*|--create=*)
			CREATE="${i#*=}"
			shift # past argument=value
			;;
			-r=*|--remove=*)
			REMOVE="${i#*=}"
			shift # past argument with no value
			;;
			-*|--*)
			echo "Unknown option $i"
			exit 1
			;;
			*)
			;;
		esac
	done


	cd "/var/www/html/${SYSTEM}/users"

	if [ ! -z "$CREATE" ]; then
		mkdir -p "$CREATE"
	fi

	if [ ! -z "$REMOVE" ]; then
		rm -rf "$REMOVE"
	fi
else
	apache2ctl -D FOREGROUND
fi
