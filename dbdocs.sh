#!/bin/bash
set -ex

echo "Dbdocs started"

#Generate password in order to protect the project's diagram url
DBDOCS_PASSWORD=$(echo -n "$REPOSITORY$(date +%s)" | sha1sum | head -c 40)

sudo npm install -g dbdocs 
dbdocs
asdf=$(dbdocs build $DBDOCS_PATH/$REPOSITORY-database.dbml --project=$REPOSITORY --password=$DBDOCS_PASSWORD)

echo $asdf
echo "DBDOCS_PASSWORD=$DBDOCS_PASSWORD" >> $GITHUB_ENV
echo "Dbdocs ran successfully!"