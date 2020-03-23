package WaitersList;

/** Will probably be deleted since this data will be stored in sql not used anymore */

/*
public class WaitersList {
    private static WaitersList single_instance = null;
    //We may need to use the synchronized version of this if were gonna have more threads using it ???
    Map<int,Waiter> allWaiters = new HashMap<>();

    public void addWaiter(Waiter waiter){
        allWaiters.put(waiter.getID(), waiter);
    }

    public Waiter getWaiter(int id){
        return allWaiters.get(id);
    }

    public boolean addTable(String id, int tableNumber){
        return getWaiter(id).addTable((new Table(tableNumber, )));
    }

    public static WaitersList getInstance()
    {
        if (single_instance == null)
            single_instance = new WaitersList();

        return single_instance;
    }

}
*/
