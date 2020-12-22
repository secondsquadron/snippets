# Scripts and snippets
**Some of my scripts and code snippets I use**  
Please note that these scripts and snippets are mainly written to use by myself, not for general public.  
Therefore, elegancy and corner cases were not in mind when these code were written.

## yt-down.sh
This script downloads a video or a livestream from youtube, optionally convert ts stream to mp4.  
_Needed tools:_
  - **yt-dl**  
  This is the main tool which can download a video or a stream from the current position.
  - **streamlink** _(optional)_  
  This tool can download streams from multiple platforms. It can also save the stream from the beginning.
  - **ffmpeg** _(optional)_  
  This tool can convert the downloaded TS (transport stream) file to mp4. TS file could be played by a video player however playing from given position will not work.

## downsize.sh
This script reduces the size and quality in current directory.
