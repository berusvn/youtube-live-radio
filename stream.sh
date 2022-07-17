#!/bin/bash

set -e

while true
do
  ffmpeg -loglevel info -y -re \
    -f image2 -loop 1 -i bkg.gif \
    -i "https://berus-lofi.run.goorm.io/stream" \
    -vf "scale=iw*sar:ih,setsar=1,pad='max(iw+mod(iw,2),2*trunc(ih*16/9/2))':'max(ih+mod(ih,2),2*trunc(iw*9/16/2))':-1:-1, drawtext=fontfile=font.ttf:fontsize=40:fontcolor=white:shadowcolor=black:textfile=livetext.txt:reload=1:y=(main_h-60):x=(w-tw)/2, format=yuv420p" \
    -c:v libx264 -preset veryfast -b:v 3000k -maxrate 3000k -bufsize 6000k \
    -framerate 25 -video_size 1920x1080 -g 50 -shortest -strict experimental \
    -c:a aac -b:a 128k -ar 44100 \
    -f flv rtmp://b.rtmp.youtube.com/live2?backup=1/2x25-2wcj-f5c3-5jpz-14u5
done
