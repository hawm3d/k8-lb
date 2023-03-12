FROM alpine:3.10.1

RUN apk add --update bash socat

COPY k8-lb.sh /usr/bin/k8-lb

ENTRYPOINT ["k8-lb"]
