ffmpeg -i 字幕条.mov  -c:v libvpx -crf 10 -b:v 1M -auto-alt-ref 0 -c:a libvorbis 字幕条.webm
ffmpeg -i 字幕条.mov 字幕条.mp4

