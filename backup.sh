token="dropbox-token-here"
database="database-name-here"
timestamp=`date +%Y-%m-%d`
backupDir="$HOME/pg_backup"
filename="$backupDir/backup-$timestamp.sql"
pg_dump $database > $filename
curl -H "Authorization: Bearer $token" https://api-content.dropbox.com/1/files_put/auto/ -T $filename
rm $filename
