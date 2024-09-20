// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import { getAnalytics } from "firebase/analytics";
import { getAuth } from 'firebase/auth';
import { getFirestore } from 'firebase/firestore';

// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
  apiKey: "AIzaSyDfftmWOO_1fQIFRnr2TWMVTUHDLqXq-IU",
  authDomain: "femmebuy-6f133.firebaseapp.com",
  projectId: "femmebuy-6f133",
  storageBucket: "femmebuy-6f133.appspot.com",
  messagingSenderId: "205780907791",
  appId: "1:205780907791:web:13f0b1772263300023b07a",
  measurementId: "G-CRWSRP9HYV"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);
export const auth = getAuth(app);
export const db = getFirestore(app);