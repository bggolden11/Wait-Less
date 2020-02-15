package Members;

import Objects.Table;

import java.util.LinkedList;
import java.util.Queue;

public class Waiter {
    private String name;
    private Queue<Table> tableQueue = new LinkedList<>();

    public Waiter(String name){
        this.name = name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setTableQueue(Queue<Table> tableQueue) {
        this.tableQueue = tableQueue;
    }

    public String getName() {
        return name;
    }

    Queue<Table> getTables(){
        return tableQueue;
    }

    boolean addTable(Table table){
        return tableQueue.add(table);
    }

}
