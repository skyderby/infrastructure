#!/bin/bash

wal_files=$(docker volume inspect pg_wal_archive --format '{{ .Mountpoint }}')

/usr/local/bin/aws s3 sync --delete $wal_files s3://wal-files.skyderby.ru/
