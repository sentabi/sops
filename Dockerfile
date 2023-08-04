FROM golang:1.20

COPY . /go/src/go.mozilla.org/sops
WORKDIR /go/src/go.mozilla.org/sops

RUN CGO_ENABLED=1 make install
