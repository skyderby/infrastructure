#!/bin/bash

app_files=$(docker volume inspect app_system --format '{{ .Mountpoint }}')

/urs/local/bin/aws s3 sync $app_files s3://app-files.skyderby.ru
