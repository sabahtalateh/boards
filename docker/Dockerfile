FROM golang:1.21 as builder
WORKDIR /build
COPY . .
RUN go build -o program main.go

FROM alpine:3.18
RUN apk add gcompat
WORKDIR /
COPY --from=builder /build/program /program
CMD ["/program"]
