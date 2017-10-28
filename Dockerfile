FROM alpine:latest

RUN \
    apk update && \
    apk add mpd && \
    rm -rf /var/lib/mpd/* && \
    rm -rf /var/cache/apk/* && \
    mkdir -p /mpd/playlists /mpd/cache /mpd/music

COPY mpd.conf /etc/mpd.conf

EXPOSE 8000 6600

COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
