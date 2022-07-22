FROM alpine:3.16

RUN apk add --no-cache \
  fio \
  libaio

ENTRYPOINT ["fio"]

