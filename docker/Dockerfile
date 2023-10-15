FROM --platform=$BUILDPLATFORM alpine:3.18

RUN arch=$(arch | sed s/aarch64/arm64/ | sed s/x86_64/amd64/) && \
    wget -O go1.21.3.linux-${arch}.tar.gz https://go.dev/dl/go1.21.3.linux-${arch}.tar.gz && \
    tar -xf go1.21.3.linux-${arch}.tar.gz

ADD . /root/go/src/github.com/sabahtalateh/boards

WORKDIR /root/go/src/github.com/sabahtalateh/boards

RUN /go/bin/go mod tidy

CMD ["/go/bin/go", "run", "main.go"]
