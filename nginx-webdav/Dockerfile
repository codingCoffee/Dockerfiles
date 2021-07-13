FROM nginx:1.21.1-alpine


LABEL maintainer="Ameya Shenoy <shenoy.ameya@gmail.com>"

COPY entrypoint.sh /
RUN set -ex \
  && apk add --no-cache \
    apache2-utils \
  && chmod +x entrypoint.sh

VOLUME /srv
EXPOSE 80
COPY webdav.conf /etc/nginx/conf.d/default.conf

CMD /entrypoint.sh && nginx -g "daemon off;"

