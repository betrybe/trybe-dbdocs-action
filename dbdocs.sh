#!/bin/bash
set -e

echo "Starting Dbdocs proccess"

sudo npm install -g dbdocs 
dbdocs
dbdocs build ./docs/lms-database.dbml --project=$REPOSITORY --password=57KY3ccUTQWZktrQDjvMmcjAShf4BnmU

echo "Success!"