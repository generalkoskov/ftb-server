FROM java:8

RUN mkdir /tmp/feed-the-beast && cd /tmp/feed-the-beast && \
	wget -c https://media.forgecdn.net/files/2459/701/FTBInfinityServer_3.0.1.zip && \
	unzip FTBInfinityServer_3.0.1.zip && \
	rm FTBInfinityServer_3.0.1.zip && \
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
ENV JVM_OPTS -Xms1024m -Xmx6144m
