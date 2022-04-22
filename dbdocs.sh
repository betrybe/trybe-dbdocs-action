#!/bin/bash
set -e

echo "Dbdocs started"

#Generate password in order to protect the project's diagram url
DBDOCS_PASSWORD=$(echo -n "$REPOSITORY$(date +%s)" | sha1sum | head -c 40)

#File path through filename
PATH=$(echo $(find $(pwd -L) -name $DBDOCS_FILENAME))

echo "DBDOCS_FILENAME $DBDOCS_FILENAME"
echo "FILE PATH $PATH"

echo "Install Dbdocs"
echo "sudo npm install -g dbdocs"

#echo "Check Dbdocs"
#dbdocs

#Building dbdocs
echo "Build Diagram"
echo "dbdocs build lego-lms/lego-lms/docs/lego-lms-database.dbml --password=$DBDOCS_PASSWORD"

#https://dbdocs.io/username/your_project
echo "https://dbdocs.io/tech-ops/$REPOSITORY"
echo "DBDOCS_PASSWORD=$DBDOCS_PASSWORD" >> $GITHUB_ENV
echo "url=$url" >> $GITHUB_ENV
echo "Dbdocs ran successfully!"