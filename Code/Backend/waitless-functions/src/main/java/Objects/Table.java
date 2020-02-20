package Objects;

public class Table {
    int tableID;
    String tableName;
    int prefferedWaiterID;
    String tableMessages;

    public Table(int numTable, String tableName, int prefferedWaiterID, String tableMessages){
        this.tableID = numTable;
        this.tableName = tableName;
        this.prefferedWaiterID = prefferedWaiterID;
        this.tableMessages = tableMessages;
    }
    
    public boolean addTable(Table table){
        return false;
    }

}
