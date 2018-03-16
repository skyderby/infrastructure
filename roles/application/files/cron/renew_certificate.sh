#!/bin/bash

docker run --rm \
  --volumes-from  skyderby_app_1 \
  -v /etc/letsencrypt:/etc/letsencrypt \
  certbot/certbot certonly \
    --webroot \
    --email skyksandr@gmail.com \
    -d skyderby.ru \
    -d www.skyderby.ru \
    -w /opt/app/public \
  >> /root/cron_logs/renew_certificate.log 2>&1

docker restart skyderby_web_1 >> /root/cron_logs/renew_certificate.log 2>&1
