#!/bin/bash
set -ex

echo "Starting Dbdocs proccess"

DBDOCS_PASSWORD=$(echo -n "$REPOSITORY$(date +%s)" | sha1sum | head -c 40)

echo "DBDOCS_PASSWORD=$DBDOCS_PASSWORD" >> $GITHUB_ENV

sudo npm install -g dbdocs 
#dbdocs
ls -a
#dbdocs build ./docs/lms-database.dbml --project=lego-lms
dbdocs build $REPOSITORY_PATH/$DBDOCS_PATH/$REPOSITORY-database.dbml --project=$REPOSITORY --password=$DBDOCS_PASSWORD

echo "Success!"