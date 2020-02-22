package Models;

public class Waiter {
    private int id;
    private String name;
    /**
    this does not need to be stored for every waiter,
    instead we could have a sql table that contains all
    pending requests from a corresponding table ID. The waiter
    will be able to see all current requests that are pending
    from all table IDs, but with preference to the table IDs that
    they are currently waiting
    **/

    public Waiter(int id,String name){
        this.id = id;
        this.name = name;
    }

    public Waiter(String name){
        this.id = -1;
        this.name = name;
    }

    public int getID(){
        return this.id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }


}
