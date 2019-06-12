FROM alpine:3.8

COPY start_proxy.sh /start_proxy.sh
RUN echo "==> Installing..."  &&\   
    apk add --no-cache sshpass openssh &&\
    chmod +x /start_proxy.sh

CMD ["/start_proxy.sh"]
