#!/bin/bash

wal_files=$(docker volume inspect pg_wal_archive --format '{{ .Mountpoint }}')

cd /opt/app/skyderby

# Perform backup and upload to s3
docker-compose exec -T db /bin/bash -c "pg_basebackup -F tar -D - -X f --gzip -U rep" | \
/usr/local/bin/aws s3 cp - s3://pg-backup.skyderby.ru/pg_backup.tar.gz

# Cleanup old WAL files
find $wal_files -mtime +2 -delete
