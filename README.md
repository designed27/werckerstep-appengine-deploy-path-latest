# AppEngine Deploy Path Latest

A [Wercker](http://wercker.com/) step that deploys a specified directory to [Google AppEngine](https://appengine.google.com).

You may want to deploy only your *src* or *build* directory instead of all your files including tests and other files not needed in a release.

This version runs using the latest (customizable) version of the AppEngine SDK.

## Options
### required

* `email` - The email address of the Google account to use for deployment.
* `password` - The password of the Google account to use for deployment.
* `srcpath` - The path to the directory you want to deploy (for example `./src`).

### optional

* `sdkversion` - The version of the Google AppEngine SDK to use. 
    If you get errors during deploy, check the version you specify here is available 
    at https://storage.googleapis.com/appengine-sdks/featured/google_appengine_<SDKVERSION>.zip.
    To view the latest versions search for `featured` here: https://storage.googleapis.com/appengine-sdks/
    Or go to https://developers.google.com/appengine/downloads
    Defaults to `1.9.9`.

## Example

    deploy:
        steps:
            - designed27/appengine-deploy-path-latest:
                email: $APP_ENGINE_USER
                password: $APP_ENGINE_PASS
                srcpath: ./src
                sdkversion: 1.9.9

I recommend using private deployment variables for email and password.

**Note**: The app.yaml has to be inside the `srcpath` directory.
