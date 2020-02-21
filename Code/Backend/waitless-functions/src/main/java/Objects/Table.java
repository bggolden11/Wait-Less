package Objects;

public class Table {
    int tableID;
    String tableName;
    int preferedWaiterID;
    String tableMessages;

    public Table(int numTable, String tableName, int preferredWaiterID, String tableMessages){
        this.tableID = numTable;
        this.tableName = tableName;
        this.preferedWaiterID = preferredWaiterID;
        this.tableMessages = tableMessages;
    }
    
    public boolean addTable(Table table){
        return false;
    }

}
