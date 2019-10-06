FROM arm32v7/alpine:latest

RUN set -e; \
    apk add --no-cache ca-certificates git go gcc musl-dev; \
    GOPATH=/tmp/go GOBIN=/bin/ go get -v -ldflags '-s' blitiri.com.ar/go/dnss; \
    apk del git go gcc musl-dev; \
    rm -rf /tmp/go

EXPOSE 53 53/udp

ENTRYPOINT ["/bin/dnss", "-enable_dns_to_https"]
