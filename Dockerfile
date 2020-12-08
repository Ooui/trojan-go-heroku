FROM alpine:latest

RUN apk add --no-cache --virtual .build-deps ca-certificates curl unzip

ADD trojan.sh /trojan.sh
RUN chmod +x /trojan.sh
CMD /trojan.sh
