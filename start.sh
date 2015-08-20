#!/bin/bash
Xvfb -screen 0 1024x768x16 -ac >> /root/xvfb.log 2>> /root/xvfb.log &
x11vnc -storepasswd skype /tmp/vncpass
pause 5
x11vnc -rfbauth /tmp/vncpass -display :0 -forever >> /root/x11vnc.log 2>> /root/x11vnc.log &
pulseaudio --system >> /root/pulseaudio.log 2>> /root/pulseaudio.log &
export DISPLAY=:0
wmaker >> /root/wmaker.log 2>> /root/wmaker.log &

sudo -u icecast2 icecast2 -c /etc/icecast2/icecast.xml >> /root/icecast2.log 2>> /root/icecast2.log &

darkice -c /etc/darkice.cfg >> /root/darkice.log 2>> /root/darkice.log &

nginx

echo Start Skype
skype >> /root/skype.log 2>> /root/skype.log &
bash
