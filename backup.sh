#!/bin/bash
token="dropbox-token-here"
database="database-name-here"
backupDir="/tmp"
filename="$backupDir/backup-$(date +%Y-%m-%d).gz"
pg_dump $database | gzip > $filename

bytes_to_send=$( du -b $filename | cut -f1 )
bytes_dropbox_received=$(curl -sH "Authorization: Bearer $token"  https://api-content.dropbox.com/1/files_put/auto/ -T $filename | sed -r 's@^.* "bytes": ([0-9]+).*$@\1@')

if [ $bytes_to_send != $bytes_dropbox_received ]; then
  echo 'ERROR: Bytes sent/received mismatch!' # mail would be nice here
else
  rm $filename
fi
