FROM golang:alpine as builder

WORKDIR /usr/local/go/src/app

COPY app.go .

RUN go build

FROM scratch

COPY --from=builder /usr/local/go/src/app/app /

CMD ["./app"]