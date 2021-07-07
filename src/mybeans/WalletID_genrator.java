package mybeans;

import java.sql.*;

public class WalletID_genrator {
	
	public static String generateWalletID() {
		 String AlphaNumericString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ" + "0123456789" + "abcdefghijklmnopqrstuvxyz"; 
	      StringBuilder sb = new StringBuilder(6); 

	      for(int i = 0; i< 6 ; i++) {
	    	  int index 
              = (int)(AlphaNumericString.length() 
                      * Math.random()); 

          // add Character one by one in end of sb 
          sb.append(AlphaNumericString 
                        .charAt(index)); 
	      }
	      
	      Connection con;
	      PreparedStatement pst;
	      ResultSet rs;
	      try
	      {
	      	DBConnector dbc = new DBConnector();
	         	con=dbc.getDbconnection();
	         	pst=con.prepareStatement("select * from usersdata where walletid=?;");
	         	pst.setString(1,sb.toString());
	         	rs=pst.executeQuery();
	         	if(rs.next())
	         	{
	         	 	generateWalletID();
	         	}
	         	pst=con.prepareStatement("select * from companydata where walletid=?;");
	         	pst.setString(1,sb.toString());
	         	rs=pst.executeQuery();
	         	if(rs.next())
	         	{
	         	 	generateWalletID();
	         	}
	      }
	      catch(Exception e)
	      {
	      	System.out.println(e.getMessage());
	      }
	      
	      
	      return sb.toString();
	   }
}
