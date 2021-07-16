FROM alpine:3.14.0


LABEL maintainer="Ameya Shenoy <shenoy.ameya@gmail.com>"

COPY entrypoint.sh /
RUN set -ex \
  && apk add --no-cache \
    apache2-utils \
    nginx \
    nginx-mod-http-dav-ext \
  && ln -sf /dev/stdout /var/log/nginx/access.log \
  && ln -sf /dev/stderr /var/log/nginx/error.log \
  && chmod +x entrypoint.sh

VOLUME /usr/local/share
EXPOSE 80
COPY webdav.conf /etc/nginx/http.d/default.conf

CMD /entrypoint.sh && nginx -g "daemon off;"

