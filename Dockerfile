FROM alpine:3.16

RUN apk add --no-cache \
  fio \
  libaio

#fix cves
RUN apk update --no-cache \
  busybox \
  ssl_client \
  --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community


COPY jobs /jobs

ENTRYPOINT ["fio"]