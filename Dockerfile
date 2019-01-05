FROM lsiobase/alpine:3.8

LABEL maintainer="Herald Yu <yuhr123@gmail.com>"

RUN apk add --no-cache --upgrade \
	ca-certificates \
	bash \
	wget \
	curl \
	jq \
	unzip \
	openssl \
	darkhttpd \
	aria2 && \
	mkdir -p /config && \
	mkdir -p /config-copy && \
	mkdir -p /data && \
	curl -sL https://api.github.com/repos/mayswind/AriaNg/releases/latest \
	| jq -r '.assets[1].browser_download_url' \
	| wget -qi - -O AriaNg.zip && \
	unzip AriaNg.zip -d AriaNg && \
	rm AriaNg.zip

ADD files/start.sh /config-copy/start.sh
ADD files/aria2.conf /config-copy/aria2.conf
ADD files/on-complete.sh /config-copy/on-complete.sh
ADD files/dht.dat /config-copy/dht.dat

RUN chmod +x /config-copy/start.sh

WORKDIR /
VOLUME ["/data"]
VOLUME ["/config"]
EXPOSE 6800
EXPOSE 80
EXPOSE 8080

CMD ["/config-copy/start.sh"]
