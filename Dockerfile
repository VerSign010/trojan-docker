FROM alpine:latest
RUN apk update
RUN apk upgrade
RUN apk add --no-cache --virtual .build-deps ca-certificates curl bash openssl
ADD /trojan/config.json /trojan/config.json
RUN chmod +x /trojan/config.json

ADD /trojan/certificate.crt /trojan/certificate.crt
RUN chmod +x /trojan/certificate.crt

ADD /trojan/private.key /trojan/private.key
RUN chmod +x /trojan/private.key

ADD /trojan/trojan /trojan/trojan
RUN chmod +x /trojan/trojan

ADD configure.sh /configure.sh
RUN chmod +x /configure.sh
CMD /configure.sh
