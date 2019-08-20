FROM ubuntu:18.04
COPY config /config
COPY sources.list /etc/apt/sources.list

RUN echo "==> Installing..."  &&\   
    apt-get update -qq &&\
    apt-get install -qq --no-install-recommends polipo shadowsocks ssh supervisor &&\
    echo "==> Clean up..."  &&\   
	rm -rf /var/lib/apt/lists/*     &&\
    chmod +x /config/start_proxy.sh	&&\
    chmod 0600 /config/hunch_hongkong.pem
COPY config/ssh.conf /etc/supervisor/conf.d
CMD ["/config/start_proxy.sh"]
