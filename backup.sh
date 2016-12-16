#!/bin/bash
token="dropbox-token-here"
database="database-name-here"
backupDir="/tmp"
filename="$backupDir/backup-$(date +%Y-%m-%d).sql"
pg_dump $database > $filename
curl -H "Authorization: Bearer $token" https://api-content.dropbox.com/1/files_put/auto/ -T $filename && rm $filename || echo 'Curl returned error:'$?
