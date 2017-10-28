#!/usr/bin/env sh

touch /mpd/cache/{tag_cache,state,sticker.sql} \
  && chmod -R 0777 /mpd/cache

# overwrite system conf with user provided conf
[ -e "/mpd/etc/mpd.conf" ] && cp /mpd/etc/mpd.conf /etc/mpd.conf

# fallback: if no /mpd/etc/mpd.conf exists, copy current system mpd.conf to
# host-space
[ ! -e "/mpd/etc" ] && mkdir -p /mpd/etc
[ ! -e "/mpd/etc/mpd.conf" ] && cp /etc/mpd.conf /mpd/etc/mpd.conf

## start
exec mpd --no-daemon --stdout --verbose /etc/mpd.conf "$@"
