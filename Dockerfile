FROM alpine:3.5
RUN apk add --no-cache --virtual .build-deps curl ca-certificates \
 && curl -L -o /frp.tar.gz --insecure https://github.com/fatedier/frp/releases/download/v0.32.0/frp_0.32.0_linux_amd64.tar.gz \
 && ls -lh /frp.tar.gz \
 && tar -zxvf /frp.tar.gz frp_0.32.0_linux_amd64/frps \
 && pwd \
 && ls -lh frp_0.32.0_linux_amd64/frps \
 && mv frp_0.32.0_linux_amd64/frps /usr/bin/frps \
 && ls -lh /usr/bin/frps \
 && chmod +x /usr/bin/frps \
 && rm -rf /frp* frp*
CMD ["/usr/bin/frps", "--vhost_http_port=80" "--bind_port=7000"]
EXPOSE 80 443 7000 7500 10000
