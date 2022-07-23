FROM alpine:3.16

RUN apk add --no-cache \
  fio \
  libaio

#fix cves
RUN apk update --no-cache \
  busybox \
  ssl_client \
  --update-cache \
  --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ \
  --allow-untrusted


COPY jobs /jobs

ENTRYPOINT ["fio"]