#!/bin/bash
set -e

echo "Dbdocs started"

#Generate password in order to protect the project's diagram url
DBDOCS_PASSWORD=$(echo -n "$REPOSITORY$(date +%s)" | sha1sum | head -c 40)

#File path through filename
FILEPATH=$(echo $(find $(pwd -L) -name $DBDOCS_FILENAME))
REMOVE_PATH="/home/runner/work/$REPOSITORY/$REPOSITORY/$REPOSITORY_PATH"
URL=$(echo "${FILEPATH/$REMOVE_PATH/""}")

#Set value to dbdocs project parameter 
PROJECT=$REPOSITORY

echo "Install Dbdocs"
sudo npm install -g dbdocs

echo "Check Dbdocs"
dbdocs

#Building dbdocs
echo "Build Diagram"

#https://dbdocs.io/username/your_project
echo "https://dbdocs.io/tech-ops/$REPOSITORY"
echo "DBDOCS_PASSWORD=$DBDOCS_PASSWORD"

dbdocs build ./$URL --project=$PROJECT --password=$DBDOCS_PASSWORD

echo "Dbdocs ran successfully!"