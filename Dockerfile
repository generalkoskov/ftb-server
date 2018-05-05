FROM java:8

RUN mkdir /tmp/feed-the-beast && cd /tmp/feed-the-beast && \
	wget -c https://www.feed-the-beast.com/projects/ftb-infinity-evolved/files/2459695/download && \
	unzip FTBInfinity-3.0.1-1.7.10.zip && \
	rm FTBInfinity-3.0.1-1.7.10.zip && \
	bash -x FTBInstall.sh && \
	chown -R minecraft /tmp/feed-the-beast


USER minecraft

EXPOSE 25565

ADD start.sh /start

VOLUME /data
ADD server.properties /tmp/server.properties
WORKDIR /data

CMD /start

ENV MOTD GeneralKoskov Free the Beast (FTB-Infinity)
ENV LEVEL world
ENV JVM_OPTS -Xms2048m -Xmx6144m
