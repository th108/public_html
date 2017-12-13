- `apk add curl perl perl-net-ssleay`
- `curl -sL http://prdownloads.sourceforge.net/webadmin/webmin-1.870.tar.gz -o webmin.tar.gz`
- `tar zxf webmin.tar.gz -C /var/lib/`
- `mv /var/lib/webmin-1.870 /var/lib/webmin`
- `cd /var/lib/webmin && ./setup.sh`
```sh
/etc/webmin
/var/log/webmin
/usr/bin/perl
${WEBMIN_PORT}
${WEBMIN_USERNAME}
${WEBMIN_PASSWORD}
${WEBMIN_PASSWORD}
y
```
check service: `rc-service webmin status`

*thanks to: https://www.hiroom2.com/2017/08/23/alpinelinux-3-6-webmin-en*
