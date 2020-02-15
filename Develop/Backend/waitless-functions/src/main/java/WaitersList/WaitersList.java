package WaitersList;

import Members.Waiter;

import java.util.*;

public class WaitersList {
    private static WaitersList single_instance = null;
    //We may need to use the synchronized version of this if were gonna have more threads using it ???
    Map<String,Waiter> allWaiters = new HashMap<>();

    public boolean addWaiter(Waiter waiter){
        return allWaiters.put(waiter.getName(), waiter) == waiter;
    }
    public static WaitersList getInstance()
    {
        if (single_instance == null)
            single_instance = new WaitersList();

        return single_instance;
    }

}
