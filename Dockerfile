FROM alpine:edge

RUN apk add --no-cache \
  fio \
  libaio

COPY jobs /jobs

ENTRYPOINT ["fio"]