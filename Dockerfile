FROM cgr.dev/chainguard/go:latest-dev
#FROM golang:1.23.6-alpine3.21

WORKDIR /app
COPY acl.yaml config.yaml .

RUN apk add --no-cache git
RUN git clone https://github.com/stripe/smokescreen.git 
WORKDIR /app/smokescreen
RUN go build

EXPOSE 4750

ENTRYPOINT ["./smokescreen"]
CMD ["--config-file", "/app/config.yaml", "--egress-acl-file", "/app/acl.yaml"]
#CMD ["./smokescreen"]
