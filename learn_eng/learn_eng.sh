#!/bin/bash

# Small script which helps learning english words.
# Dictionary is from StarDict project but processed into "plaintext" format.

trap '{ echo -e "\nexiting ..." ; exit 0; }' SIGINT SIGTERM      

script=`basename "$0"`

if [ "$1" == "-h" ] || [ "$1" == "--help" ] || [ "$1" == "-help" ]
then
    echo "Usage : $script [eng|hun]"
    echo "    eng    Asks english words (default)" 
    echo "    hun    Asks hungarian words"
    exit 0
fi

if [ "$1" != "eng" ] && [ "$1" != "hun" ] && [ "$1" != "" ]
then
    echo "Unknown param $1. See -h or --help for params."
    exit 1
fi

line="y"
while [ "$line" != "n" ]
do
	clear
	rand=$RANDOM
	while [ $rand -ge 46160 ] || [ $rand -lt 1 ]
	do
		rand=$RANDOM
	done

	row=`cat eng-hun.txt | awk 'BEGIN{FS="\t"}'"{if(NR==$rand)"'print $1 "+" $2}'`
	row=`echo "$row" | sed -e 's/ /-/g;s/\+/ /g'`
	cnt=1
	for i in $row
	do
		if [ $cnt -eq 1 ]
		then eng=$i
		else hun=$i
		fi
		let "cnt += 1"
	done
	eng=`echo $eng | sed -e 's/-/ /g;s/\x27//g'`
	eng=`echo $eng | sed -e 's/^[ \t]*//;s/[ \t]*$//'`
	hun=`echo $hun | sed -e 's/-/ /g;s/\x27//g'`
	hun=`echo $hun | sed -e 's/^[ \t]*//;s/[ \t]*$//'`

	if [ "$1" == "eng" ] || [ "$1" == "" ]
	then
		echo -n "What is \"$eng\"  ?  : "
		read line
		if [ "$hun" != "$line" ]
		then echo "Bad answer. The right answer was \"$hun\" !"
		else echo "Right answer!"
		fi
	fi
	
	if [ "$1" == "hun" ]
	then
	echo -n "What is \"$hun\"  ?  : "
		read line
		if [ "$eng" != "$line" ]
		then echo "Bad answer. The right answer was \"$eng\" !"
		else echo "Right answer!"
		fi

	fi
	
	echo -n "Continue ? (y/n) :"
	read line
done

