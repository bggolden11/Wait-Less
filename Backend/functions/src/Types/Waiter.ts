import { Queue } from 'queue-typescript';
import {Table} from "./Table";
export class Waiter{
    name:string;
    tablesToVisit = new Queue<Table>();
    constructor(theName:string){
        this.name = theName;

    }
    addToQueue(table:Table){
        this.tablesToVisit.enqueue(table);
    }
    getNextInQueue(){
        return this.tablesToVisit.dequeue();
    }
}