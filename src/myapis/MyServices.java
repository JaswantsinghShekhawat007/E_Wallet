package myapis;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;


import mybeans.WalletBalance;

@Path("/balance")
public class MyServices {
	
	@Path("/{id}")
	@GET
    @Produces({MediaType.APPLICATION_JSON})
    public WalletBalance getJSON(@PathParam("id") String walletid) {
        WalletBalance todo = new WalletBalance(walletid);
        double balance = todo.getBalance();
        return todo;
    }
	
	
	

}
