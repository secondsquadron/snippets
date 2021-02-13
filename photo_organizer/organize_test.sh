#!/bin/bash

# This script creates test files for organizer script.

# 10 files for 02.03
for i in `seq 10 20`
do
    touch "IMG_65${i}.JPG" -t "1502031122"
done

# 30 files for 02.04
for i in `seq 30 60`
do
    touch "IMG_66${i}.JPG" -t "1502041122"
done

# 20 files for 02.07
for i in `seq 50 70`
do
    touch "IMG_672${i}.JPG" -t "1502071122"
done

# 10 files for random dates
for i in `seq 10 20`
do
    month=`echo $RANDOM | sed -e 's/\(^.\).*/\1/'`
    day=`echo $RANDOM | sed -e 's/\(^.\).*/\1/'`
    touch "IMG_682${i}.JPG" -t "150${month}0${day}1122"
done

