FROM ubuntu:18.04
COPY config /config

RUN echo "==> Installing..."  &&\   
    apt-get update -qq &&\
    apt-get install -qq --no-install-recommends polipo shadowsocks ssh &&\
    echo "==> Clean up..."  &&\   
	rm -rf /var/lib/apt/lists/*     &&\
    chmod +x /config/start_proxy.sh

CMD ["/config/start_proxy.sh"]
