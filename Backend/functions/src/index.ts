import * as functions from 'firebase-functions';
import {Waiter} from "./Types/Waiter";
import { Table } from './Types/Table';

// // Start writing Firebase Functions
// // https://firebase.google.com/docs/functions/typescript
//
export const helloWorld = functions.https.onRequest((request, response) => {
let waiter = new Waiter("Jane Doe");
waiter.addToQueue(new Table("Not a real table",3,3,));
console.log("Waiter name " + waiter.name + "\n");
console.log("Table name " + waiter.getNextInQueue().name);
   
 response.send("Hello from Firebase!");
});


