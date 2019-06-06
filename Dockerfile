FROM webhippie/golang:latest

LABEL maintainer="Thomas Boerger <thomas@webhippie.de>" \
  org.label-schema.name="Goswagger" \
  org.label-schema.vendor="Thomas Boerger" \
  org.label-schema.schema-version="1.0"

ENTRYPOINT ["/usr/bin/swagger"]

RUN apk update && \
  apk upgrade && \
  rm -rf /var/cache/apk/*

RUN wget -q -O /usr/bin/swagger https://github.com/go-swagger/go-swagger/releases/download/v0.19.0/swagger_linux_amd64 && \
  chmod +x /usr/bin/swagger
