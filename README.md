# AppEngine Deploy Path Latest

A [Wercker](http://wercker.com/) step that deploys a specified directory to [Google AppEngine](https://appengine.google.com).

You may want to deploy only your *src* or *build* directory instead of all your files including tests and other files not needed in a release.

This version deploys using the latest (customizable) version of the AppEngine SDK. On first run, it will download the AppEngine SDK to the cache directory. Every deploy after will then check the cache first and only download if not found - greatly improving deploy times.

[![wercker status](https://app.wercker.com/status/34cb20f93815c598b7ab450fc5c88d08/s/master "wercker status")](https://app.wercker.com/project/bykey/34cb20f93815c598b7ab450fc5c88d08)

## Options
### required

* `email` - The email address of the Google account to use for deployment.
* `password` - The password of the Google account to use for deployment.
* `srcpath` - The path to the directory you want to deploy (for example `./src`).

    **Note**: The app.yaml has to be inside the `srcpath` directory.
    
Make sure to use private deployment variables for email and password.

### optional

* `sdkversion` - The version of the Google AppEngine SDK to use. 

    If you get errors during deploy, check that the version you specify here is available 
    at `https://storage.googleapis.com/appengine-sdks/featured/google_appengine_--SDKVERSION--.zip`.
    
    To view the latest versions search for `featured` here: `https://storage.googleapis.com/appengine-sdks/`.
    Or go to `https://developers.google.com/appengine/downloads`.
    
    Defaults to `1.9.9`.

## Example

### Fully Customized
    deploy:
        steps:
            - designed27/appengine-deploy-path-latest:
                email: $APP_ENGINE_USER
                password: $APP_ENGINE_PASS
                srcpath: ./src
                sdkversion: 1.9.9
                
### Default Version and Root Source Path
    deploy:
        steps:
            - designed27/appengine-deploy-path-latest:
                email: $APP_ENGINE_USER
                password: $APP_ENGINE_PASS
                srcpath: ./
