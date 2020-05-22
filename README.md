# HDFFA Food Finder

Capstone project for HDFFA, providing a mobile-friendly navigable map containing all HDFFA partners with relevant details for their locations and contact info.

## Set Up Dev Environment

1. Clone, cd into directory
2. Have recent version of Node.js (8.10.0 or better is recommended)
3. Run `npm install -g firebase-tools`
4. Run `npm install -g http-server`
5. Log into Firebase with the command `firebase login`, and use HDFFA's credentials (email/username: app@hdffa.org, password: tmbF0mmX)
6. Add the following in a file called `config.js` in the `public/` directory:

```const prodConfig = {
    apiKey: "AIzaSyD9d2WiBXKnszB7BOmaYpnkvbaJrVGtYa8",
    authDomain: "hdffa-app.firebaseapp.com",
    databaseURL: "https://hdffa-app.firebaseio.com",
    projectId: "hdffa-app",
    storageBucket: "hdffa-app.appspot.com",
    messagingSenderId: "301209200300",
    appId: "301209200300:web:2c705453275ee922cc2109",
    measurementId: "G-4Q5LG2V1FF"
};

const devConfig = {
    apiKey: "AIzaSyD1WtRQqbsdQSfXSvSSHeX7AFBvByxDaBQ",
    authDomain: "hdffa-dev.firebaseapp.com",
    databaseURL: "https://hdffa-dev.firebaseio.com",
    projectId: "hdffa-dev",
    storageBucket: "hdffa-dev.appspot.com",
    messagingSenderId: "861981906703",
    appId: "1:861981906703:web:87aaea299e17350474907a",
    measurementId: "G-6TH66WM1B7"
  };

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