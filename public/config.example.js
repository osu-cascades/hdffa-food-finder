const firebaseConfig = {
    apiKey: API_KEY_HERE,
    authDomain: "hdffa-app.firebaseapp.com",
    databaseURL: "https://hdffa-app.firebaseio.com",
    projectId: "hdffa-app",
    storageBucket: "hdffa-app.appspot.com",
    messagingSenderId: SENDER_ID_HERE,
    appId: APP_ID_HERE,
    measurementId: MEASUREMENT_ID_HERE
};

const devConfig = {
    apiKey: API_KEY_HERE,
    authDomain: "hdffa-dev.firebaseapp.com",
    databaseURL: "https://hdffa-dev.firebaseio.com",
    projectId: "hdffa-dev",
    storageBucket: "hdffa-dev.appspot.com",
    messagingSenderId: SENDER_ID_HERE,
    appId: APP_ID_HERE,
    measurementId: MEASUREMENT_ID_HERE
};


firebase.initializeApp(firebaseConfig);