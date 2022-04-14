#!/bin/bash
set -e

echo "Dbdocs started"

#Generate password in order to protect the project's diagram url
DBDOCS_PASSWORD=$(echo -n "$REPOSITORY$(date +%s)" | sha1sum | head -c 40)

echo "REPOSITORY $REPOSITORY"
echo "REPOSITORY_PATH $REPOSITORY_PATH"
echo "Install Dbdocs"
sudo npm install -g dbdocs 
#echo "Check Dbdocs"
#dbdocs
echo "Build Diagram"

dbdocs build $DBDOCS_PATH/$REPOSITORY-database.dbml --project=$REPOSITORY --password=$DBDOCS_PASSWORD >> url.txt

grep "https://dbdocs.io/" url.txt
echo "DBDOCS_PASSWORD=$DBDOCS_PASSWORD" >> $GITHUB_ENV
echo "url=$url" >> $GITHUB_ENV
echo "Dbdocs ran successfully!"

#awk


