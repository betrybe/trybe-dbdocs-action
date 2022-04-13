#!/bin/bash
set -ex

echo "Starting Dbdocs proccess"

DBDOCS_PASSWORD=$(echo -n "$REPOSITORY$(date +%s)" | sha1sum | head -c 40)

echo "DBDOCS_PASSWORD=$DBDOCS_PASSWORD" >> $GITHUB_ENV

sudo npm install -g dbdocs 
dbdocs
#ls -a
dbdocs build $DBDOCS_PATH/$REPOSITORY-database.dbml --project=$REPOSITORY --password=$DBDOCS_PASSWORD


echo '
 _____            _
/__   \_ __ _   _| |__   ___
  / /\/ `__| | | | `_ \ / _ \
 / /  | |  | |_| | |_) |  __/
 \/   |_|   \__, |_.__/ \___|
            |___/
   ___ _       _         __
  / _ \ | __ _| |_ __ _ / _| ___  _ __ _ __ ___   __ _
 / /_)/ |/ _` | __/ _` | |_ / _ \| `__| `_ ` _ \ / _` |
/ ___/| | (_| | || (_| |  _| (_) | |  | | | | | | (_| |
\/    |_|\__,_|\__\__,_|_|  \___/|_|  |_| |_| |_|\__,_|
'

echo "Success!"