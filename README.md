# HDFFA Food Finder

Capstone project for HDFFA, providing a mobile-friendly navigable map containing all HDFFA partners with relevant details for their locations and contact info.

## Set Up Dev Environment

1. Clone, cd into directory
2. Have recent version of Node.js (8.10.0 or better is recommended)
3. Run `npm install -g firebase-tools`
4. Run `npm install -g http-server`
5. Log into Firebase with the command `firebase login`, and use HDFFA's credentials (email/username: app@hdffa.org, password: tmbF0mmX)
6. Add the config.js in the actual config.js file on basecamp in a file called `config.js` in the `public/` directory.

// pass in whichever config you intend to deploy with
firebase.initializeApp(prodConfig);
```

## Run Local Environment:

* To run w/ dev config: `npm run dev`
* To run w/ prod config: `npm run prod`

At present, this only works with Bash due to how environment variables are used in the scripts.

Windows scripts should be added.

## Deployment Steps

1. Select config to use, run either `firebase use development` or `firebase use default` in command line
2. Run `firebase deploy`

Then open your browser and validate the deployment

## Web Links:

* hdffa-app.web.app: Production URL
* hdffa-dev.web.app Staging URL

To log into admin portal, navigate to (URL)/admin.html and use following credentials: email/username: test@test.test, password: pass1234. This will eventually change to a more secure version on production, but for now this will suffice. 