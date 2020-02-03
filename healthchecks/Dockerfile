FROM python:alpine

# TODO do not run uwsgi as root Ref: https://github.com/healthchecks/healthchecks/pull/230/files

RUN set -ex \
  && apk add --no-cache --virtual .build-deps \
    gcc \
    git \
    libc-dev \
    linux-headers \
    musl-dev \
    postgresql-dev \
    python3-dev \
  && pip install -U \
    pip \
    uwsgi \
  && cd /opt \
  && git clone https://github.com/healthchecks/healthchecks \
  && cd /opt/healthchecks \
  && pip install -r requirements.txt \
  && python manage.py collectstatic --noinput \
  && python manage.py compress --force \
  && cd \
  && apk del .build-deps

WORKDIR /opt/healthchecks
COPY ./uwsgi.ini .
ENTRYPOINT python manage.py migrate && uwsgi uwsgi.ini

