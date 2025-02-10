FROM golang:1.23.6-alpine3.21

WORKDIR /app
COPY acl.yaml config.yaml /app

RUN apk add --no-cache git
RUN git clone https://github.com/stripe/smokescreen.git
RUN go build

EXPOSE 4750

CMD ["smokescreen" "--config-file" "config.yaml" "--egress-acl-file" "acl.yaml"]