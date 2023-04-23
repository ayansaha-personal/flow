importScripts("https://www.gstatic.com/firebasejs/9.10.0/firebase-app-compat.js");
importScripts("https://www.gstatic.com/firebasejs/9.10.0/firebase-messaging-compat.js");

firebase.initializeApp({
   apiKey: "AIzaSyAf1h98pbOgvZ7X1IZBjlW34vQbSPNxdfY",
   authDomain: "the-burgeon-flow.firebaseapp.com",
   projectId: "the-burgeon-flow",
   storageBucket: "the-burgeon-flow.appspot.com",
   messagingSenderId: "300761456053",
   appId: "1:300761456053:web:0038a00fd03b79dd1e0dfc",
   measurementId: "G-X2NGD4CHW3"
});
// Necessary to receive background messages:
const messaging = firebase.messaging();

// Optional:
messaging.onBackgroundMessage((m) => {
  console.log("onBackgroundMessage", m);
});z