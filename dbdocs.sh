#!/bin/bash
set -e

echo "Dbdocs started"

#Generate password in order to protect the project's diagram url
DBDOCS_PASSWORD=$(echo -n "$REPOSITORY$(date +%s)" | sha1sum | head -c 40)

#File path through filename
PATH=$(echo $(find $(pwd -L) -name $DBDOCS_FILENAME))
REMOVE_PATH="/home/runner/work/$REPOSITORY/$REPOSITORY/$REPOSITORY_PATH"
url=$(echo "${PATH/$REMOVE_PATH/""}")

echo "Install Dbdocs"
echo "sudo npm install -g dbdocs"

#echo "Check Dbdocs"
#dbdocs

#Building dbdocs
echo "Build Diagram"
#echo "dbdocs build $url --password=$DBDOCS_PASSWORD"
echo dbdocs build $url
#https://dbdocs.io/username/your_project
#echo "https://dbdocs.io/tech-ops/$REPOSITORY"
echo "DBDOCS_PASSWORD=$DBDOCS_PASSWORD" >> $GITHUB_ENV
echo "Dbdocs ran successfully!"