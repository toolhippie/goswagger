FROM webhippie/golang:1.19
ENTRYPOINT [""]

# renovate: datasource=github-releases depName=go-swagger/go-swagger
ENV GOSWAGGER_VERSION=0.30.3

ARG TARGETARCH

RUN apk update && \
  apk upgrade && \
  case "${TARGETARCH}" in \
		'amd64') \
			curl -sSLo /usr/bin/swagger https://github.com/go-swagger/go-swagger/releases/download/v${GOSWAGGER_VERSION}/swagger_linux_amd64; \
			;; \
		'arm64') \
			curl -sSLo /usr/bin/swagger https://github.com/go-swagger/go-swagger/releases/download/v${GOSWAGGER_VERSION}/swagger_linux_arm64; \
			;; \
		'arm') \
			curl -sSLo /usr/bin/swagger https://github.com/go-swagger/go-swagger/releases/download/v${GOSWAGGER_VERSION}/swagger_linux_arm; \
			;; \
		*) echo >&2 "error: unsupported architecture '${TARGETARCH}'"; exit 1 ;; \
	esac && \
  chmod +x /usr/bin/swagger && \
  rm -rf /var/cache/apk/*
