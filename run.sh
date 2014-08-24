#!/bin/sh

if [ ! -n "$WERCKER_APPENGINE_DEPLOY_PATH_LATEST_SDKVERSION" ] ; then
    info "Setting SDKVERSION to default: 1.9.9"
    export WERCKER_APPENGINE_DEPLOY_PATH_LATEST_SDKVERSION="1.9.9"
fi

sudo apt-get update
sudo apt-get install unzip

cd $WERCKER_ROOT
debug 'Downloading AppEngine SDK...'

curl -O https://storage.googleapis.com/appengine-sdks/featured/google_appengine_$WERCKER_APPENGINE_DEPLOY_PATH_LATEST_SDKVERSION.zip ; unzip -x google_appengine_$WERCKER_APPENGINE_DEPLOY_PATH_LATEST_SDKVERSION.zip
export PATH="$PATH:$(pwd)/google_appengine"

echo "$WERCKER_APPENGINE_DEPLOY_PATH_LATEST_PASSWORD" > "$WERCKER_STEP_TEMP/password"

cd $WERCKER_SOURCE_DIR

debug 'Starting deployment of directory'
appcfg.py update $WERCKER_APPENGINE_DEPLOY_PATH_LATEST_SRCPATH --email="$WERCKER_APPENGINE_DEPLOY_PATH_LATEST_EMAIL" --passin < "$WERCKER_STEP_TEMP/password"

success 'Finished'