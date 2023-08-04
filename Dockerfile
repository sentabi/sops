FROM golang:1.20 as builder

COPY . /go/src/go.mozilla.org/sops
WORKDIR /go/src/go.mozilla.org/sops
RUN CGO_ENABLED=1 make install

FROM golang:1.20
WORKDIR /app
COPY --from=builder /go/bin/sops /app/sops
ENTRYPOINT ["/app/sops"]
