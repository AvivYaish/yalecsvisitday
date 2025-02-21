#!/bin/bash

# Define variables
BUILD_DIR="public"
REMOTE_USER="fz243"  # Change this if you are using a different username
REMOTE_HOST="cs-www.cs.yale.edu"
REMOTE_PATH="/srv/www/htdocs/cswww/visitday"

# Build the site with Zola
zola build || { echo "Zola build failed!"; exit 1; }

# Use rsync to deploy the site
rsync -avz --delete "$BUILD_DIR/" "$REMOTE_USER@$REMOTE_HOST:$REMOTE_PATH/" || {
    echo "Deployment failed!";
    exit 1;
}

echo "Deployment successful!"
