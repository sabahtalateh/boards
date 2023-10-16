FROM golang:1.21 as builder
RUN go install github.com/pressly/goose/v3/cmd/goose@latest

FROM alpine:3.18
RUN apk add gcompat
WORKDIR /
COPY --from=builder /go/bin/goose /goose
COPY migrations migrations

ENV DB_NETLOC ""
ENV DB_NAME ""
ENV USER ""
ENV PASSWORD ""

CMD ["sh", "-c", "/goose --dir migrations postgres postgresql://${USER}:${PASSWORD}@${DB_NETLOC}/${DB_NAME}?sslmode=disable up"]
