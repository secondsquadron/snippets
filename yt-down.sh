#!/bin/bash

#######################################################################
# This a small script to download videos and livestreams from youtube #
#######################################################################

#TODO help message missing, verbosity parameter missing, error messages are not elegant

# check for tools first
YTDL=`which youtube-dl`
STRL=`which streamlink`
FFMP=`which ffmpeg`
LIVE="false"
NAME="Unknown"

if [ "$YTDL" == "" ]
then
    echo "ERROR: youtube-dl can not be found (is it in PATH?) ! exiting ... "
    exit 1
fi

if [ "$STRL" == "" ]
then
    echo "WARNING: streamlink can not be found (is it in PATH?) ! Stream download from the start will be not available !"
    exit 1
fi

if [ "$FFMP" == "" ]
then
    echo "WARNING: ffmpeg can not be found (is it in PATH?) ! Converting transport stream to mp4 will be not available !"
    exit 1
fi

# get params
URL=$1
QUALITY=$2

if [ "$URL" == "" ]
then
    echo "ERROR: please specify at least the URL parameter"
    exit 1
fi

if [ "$QUALITY" == "" ]
then
    QUALITY="best"
fi


# check URL
RETVAL=`$YTDL --dump-json $URL`
if [ $? -gt 0 ]
then
    echo "ERROR: tool exited with error ..."
    exit 1
else
    # check if URL is a livestream
    echo $RETVAL | grep "is_live\"\:\ true" &>/dev/null
    if [ $? == 0 ]
    then
        echo "DEBUG: $URL is livestream"

        LIVE=true
    fi
fi

echo "DEBUG: downloading $URL (live:$LIVE) with $QUALITY quality"

if [ $LIVE == "true" ]
then
    # download index image and get title
    NAME=`$YTDL -e $URL`
    $YTDL --write-thumbnail --skip-download $URL 

    # download stream
    $STRL --hls-live-restart -o "${NAME}.ts" $URL $QUALITY

    # after download convert the transport stream to mp4
    ffmpeg -i "${NAME}.ts"  -acodec copy -vcodec copy  "${NAME}.mp4"

else
    # download the vide and index image
    $YTDL --write-thumbnail $URL
fi

exit 0

