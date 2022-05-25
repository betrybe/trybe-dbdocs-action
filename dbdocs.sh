#!/bin/bash
set -e

echo "Dbdocs started"

#Generate password in order to protect the project's diagram url
DBDOCS_PASSWORD=$(echo -n "$REPOSITORY$(date +%s)" | sha1sum | head -c 40)
DBDOCS_URL=""

#File path through filename
FILEPATH=$(echo $(find $(pwd -L) -name $DBDOCS_FILENAME))
REMOVE_PATH="/home/runner/work/$REPOSITORY/$REPOSITORY/"
URL=$(echo "${FILEPATH/$REMOVE_PATH/""}")

#Set value to dbdocs project parameter 
PROJECT=$REPOSITORY
  if [[ ${REPOSITORY_PATH} != "" ]]; then
    PROJECT=$REPOSITORY_PATH
  fi

echo "Install Dbdocs"
sudo npm install -g dbdocs

echo "Check Dbdocs"
dbdocs

#Building dbdocs
echo "Build Diagram"

echo "RESPOSITORY=$REPOSITORY"
echo "REPOSITORY_PATH=$REPOSITORY_PATH"
#https://dbdocs.io/username/your_project
echo "https://dbdocs.io/tech-ops/$PROJECT"
echo "DBDOCS_PASSWORD=$DBDOCS_PASSWORD"

dbdocs build ./$URL --project=$PROJECT --password=$DBDOCS_PASSWORD

echo "DBDOCS_URL=https://dbdocs.io/tech-ops/$PROJECT" >> $GITHUB_ENV
echo "DBDOCS_PASSWORD=$DBDOCS_PASSWORD" >> $GITHUB_ENV

echo "Dbdocs ran successfully!"