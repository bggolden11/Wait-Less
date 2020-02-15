package Members;

import Objects.Table;

import java.util.LinkedList;
import java.util.Queue;

public class Waiter {
    private int id;
    private String name;
    private Queue<Table> tableQueue = new LinkedList<>();

    public Waiter(int id,String name){
        this.id = id;
        this.name = name;
    }

    public Waiter(String name){
        this.id = -1;
        this.name = name;
    }

    public int getId(){
        return this.id;
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

    public Queue<Table> getTables(){
        return tableQueue;
    }

    public boolean addTable(Table table){
        return tableQueue.add(table);
    }


}
