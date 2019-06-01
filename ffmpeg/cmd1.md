# gif转其他  
```
Mov:
ffmpeg -framerate 25 -f image2 -i 540840-20170622104455507-1160319948%d.png  -c:v libx264 -pix_fmt yuva420p -auto-alt-ref 0 new.mov
ffmpeg -framerate 10 -f image2 -i pipixia3%d.png  -c:v libx264 -pix_fmt yuva420p -auto-alt-ref 0 pipixia3.mov

ffmpeg -r 10 -i 540840-20170622104455507-1160319948%d.png -vcodec png t.mov


Webm:
ffmpeg -framerate 25 -f image2 -i 540840-20170622104455507-1160319948%d.png  -c:v libvpx -pix_fmt yuva420p -auto-alt-ref 0 new.webm 
ffmpeg -framerate 10 -f image2 -i pipixia3%d.png  -c:v libvpx -pix_fmt yuva420p -auto-alt-ref 0 pipixia3.webm 
ffmpef image2 -i pipixia3%d.png  -c:v libvpx -pix_fmt yuva420p -auto-alt-ref 0 ad_logo.webm 

Mp4:
ffmpeg -framerate 25 -f image2 -i 540840-20170622104455507-1160319948%d.png  -c:v libx264 -pix_fmt yuva420p -auto-alt-ref 0 new.mp4
ffmpeg -framerate 10 -f image2 -i pipixia3%d.png  -c:v libx264 -pix_fmt yuva420p -auto-alt-ref 0 pipixia3.mp4
```

# 转换帧率  
```
ffmpeg -i pipixia3.mov -qscale 0 -r 25 -y ad_logo.mov
```


```
* scale mov
#+BEGIN_SRC sh
ffmpeg -i input.mov -vf scale=400:400 -vcodec png -c:a copy output.mov
#+END_SRC

* crop mov with transparency
#+BEGIN_SRC sh
ffmpeg -i input.mov -filter:v "crop=400:560:300:210" -codec:v qtrle output.mov
#+END_SRC

* convert mov to webm with transparency
#+BEGIN_SRC sh
ffmpeg -i input.mov -c:v libvpx -crf 10 -b:v 1M -auto-alt-ref 0 -c:a libvorbis output.webm
#+END_SRC
```

# 成功的
```
ffmpeg -f image2 -i pipixia3%d.png  -c:v libvpx -pix_fmt yuva420p -auto-alt-ref 0 ad_logo.webm
ffmpeg -i pipixia3%d.png -vcodec png z.mov
```
