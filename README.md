# postgreSQL-dropbox-backup
A bash script that backups and uploads a PostgreSQL database to dropbox
## How to use
Download the script:
```bash
curl https://raw.githubusercontent.com/stsourlidakis/postgreSQL-dropbox-backup/master/backup.sh  -o backup.sh
```

Replace the **token** variable with your Dropbox access token, you can get it by creating a new app [here](https://www.dropbox.com/developers/apps).

Replace the **database** variable with your database's name

Make the script executable:
```bash
chmod +x backup.sh
```

Then add it to crontab or run it with:
```bash
./backup.sh
```
