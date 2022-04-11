#!/bin/bash
set -e

echo "Starting Dbdocs proccess"
echo $REPOSITORY_PATH
echo $DBDOCS_PATH

DBDOCS_PASSWORD=$(echo -n "$REPOSITORY$(date +%s)" | sha1sum | head -c 40)

echo "DBDOCS_PASSWORD=$DBDOCS_PASSWORD" >> $GITHUB_ENV

sudo npm install -g dbdocs 
dbdocs
dbdocs build $REPOSITORY_PATH/$DBDOCS_PATH/$REPOSITORY-dastabase.dbml --project=$REPOSITORY --password=DBDOCS_PASSWORD

echo "Success!"