package WaitersList;

import Members.Waiter;
import Objects.Table;

import java.util.HashMap;
import java.util.Map;


public class WaitersList {
    private static WaitersList single_instance = null;
    //We may need to use the synchronized version of this if were gonna have more threads using it ???
    Map<String,Waiter> allWaiters = new HashMap<>();

    public void addWaiter(Waiter waiter){
        allWaiters.put(waiter.getName(), waiter);
    }

    public Waiter getWaiter(String name){
        return allWaiters.get(name);
    }

    public boolean addTable(String waiterName, int tableNumber){
        return getWaiter(waiterName).addTable((new Table(tableNumber)));
    }

    public static WaitersList getInstance()
    {
        if (single_instance == null)
            single_instance = new WaitersList();

        return single_instance;
    }

}
