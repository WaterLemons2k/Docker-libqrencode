FROM alpine:3.1 AS qrencode
RUN apk -U add libqrencode &&\
    rm -rf /var/cache/* &&\
    mkdir -p qrencode/lib &&\
    cp /usr/bin/qrencode qrencode &&\
    cp /lib/ld-musl-x86_64.so.1 /usr/lib/libqrencode.so.3 /usr/lib/libpng16.so.16 /lib/libz.so.1 qrencode/lib

FROM scratch
COPY --from=qrencode qrencode /
ENTRYPOINT ["/qrencode"]
