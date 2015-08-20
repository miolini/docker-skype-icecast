FROM ubuntu:trusty

RUN apt-get install -qqy software-properties-common
RUN dpkg --add-architecture i386
RUN add-apt-repository ppa:profzoom/wmaker
RUN apt-get update
RUN apt-get -qy install pulseaudio icecast2 \
	wmaker axel wget xvfb x11vnc libc6:i386 libqt4-dbus:i386 \
	libqt4-network:i386 libqt4-xml:i386 libqtcore4:i386 libqtgui4:i386 \
	libqtwebkit4:i386 libstdc++6:i386 libx11-6:i386 libxext6:i386 libxss1:i386 \
	libxv1:i386 libssl1.0.0:i386 libpulse0:i386 libasound2-plugins:i386
RUN axel -o skype.deb http://www.skype.com/go/getskype-linux-deb
RUN dpkg -i skype.deb

RUN apt-get -qy install libmp3lame0 libtwolame0 libopus0
RUN axel -n 1 -o darkice.deb 'http://launchpadlibrarian.net/178077626/darkice_1.2-0.2_amd64.deb'
RUN dpkg -i darkice.deb
ADD etc/darkice.cfg /etc/darkice.cfg

RUN rm -rf /etc/icecast2
ADD etc/icecast2 /etc/icecast2
RUN chown -R icecast2 /etc/icecast2
EXPOSE 8000

RUN apt-get -qy install nginx
RUN rm -rf /etc/nginx/sites-enabled/default
ADD etc/nginx_broadcast.conf /etc/nginx/sites-enabled/broadcast.conf

ADD start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh
EXPOSE 5900

WORKDIR /root
CMD ["start.sh"]
