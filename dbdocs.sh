#!/bin/bash
set -e

echo "Dbdocs started"

FILENAME = $DBDCOS_FILENAME
#Generate password in order to protect the project's diagram url
DBDOCS_PASSWORD=$(echo -n "$REPOSITORY$(date +%s)" | sha1sum | head -c 40)

echo "REPOSITORY $REPOSITORY"
echo "REPOSITORY_PATH $REPOSITORY_PATH"
echo "DBDOCS_FILENAME $DBDCOS_FILENAME"

echo "Install Dbdocs"
sudo npm install -g dbdocs 
#echo "Check Dbdocs"
#dbdocs
echo "Build Diagram"

#dbdocs build docs/$REPOSITORY-database.dbml --project=$REPOSITORY --password=$DBDOCS_PASSWORD

#https://dbdocs.io/username/your_project
url=https://dbdocs.io/tech-ops/$REPOSITORY
echo "DBDOCS_URL=$url" >> $GITHUB_ENV
echo "DBDOCS_PASSWORD=$DBDOCS_PASSWORD" >> $GITHUB_ENV
echo "url=$url" >> $GITHUB_ENV
echo "Dbdocs ran successfully!"