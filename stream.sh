#!/bin/bash

set -e

while true
do
  ffmpeg -loglevel info -y -re \
    -f image2 -loop 1 -i bkg.gif \
    -f concat -safe 0 -i <((for f in ./mp3/*.mp3; do path="$PWD/$f"; echo "file ${path@Q}"; done) | shuf) \
    -c:v libx264 -preset veryfast -b:v 3000k -maxrate 3000k -bufsize 6000k \
    -framerate 25 -video_size 1280x720 -vf "format=yuv420p" -g 50 -shortest -strict experimental \
    -c:a aac -b:a 128k -ar 44100 \
    -f flv rtmp://b.rtmp.youtube.com/live2?backup=1/2x25-2wcj-f5c3-5jpz-14u5
done
