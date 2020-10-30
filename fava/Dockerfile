# builder
FROM python:alpine as builder


LABEL maintainer="Ameya Shenoy <shenoy.ameya@gmail.com>"

RUN set -ex \
  && apk add --no-cache \
    g++ \
    gcc \
    libxml2-dev \
    libxslt-dev \
    musl-dev
RUN pip install --prefix="/install" fava

# main
FROM python:alpine
COPY --from=builder /install /usr/local
ENV BEANCOUNT_FILE "/accounting.beancount"
ENV FAVA_OPTIONS   ""
EXPOSE 5000
CMD fava --host 0.0.0.0 $FAVA_OPTIONS $BEANCOUNT_FILE

