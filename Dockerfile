FROM alpine

COPY sockd.sh /usr/local/bin/

WORKDIR /app

COPY sockd.conf /etc/

COPY entrypoint.sh entrypoint.sh

RUN true \
    && apk add --update-cache dante-server openvpn bash openresolv openrc vim curl \
    && rm -rf /var/cache/apk/* \
    && chmod a+x /usr/local/bin/sockd.sh \
    && chmod a+x /app/entrypoint.sh \
    && true

CMD ["./entrypoint.sh" ]