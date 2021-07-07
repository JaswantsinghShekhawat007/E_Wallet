package mybeans;

import java.sql.*;

public class AddCashBack 
{
	private String srcwalletid;
	private String destwalletid;
	private int amount;
	private String email;
	
	public AddCashBack()
	{
		srcwalletid="";
		destwalletid="";
		amount=50;
	}
	

	public void setEmail(String email) {
		this.email = email;
	}


	
	
	public void setSrcwalletid(String srcwalletid) {
		this.srcwalletid = srcwalletid;
	}


	public void setDestwalletid(String destwalletid) {
		this.destwalletid = destwalletid;
		giveCashBack();
	}


	private void giveCashBack()
	{
		Connection con;
		CallableStatement cst;
		try
		{
			DBConnector dbc = new DBConnector();
			con=dbc.getDbconnection();
			cst=con.prepareCall("{call trans(?,?,?,?,?)}");
			cst.setString(1, srcwalletid);
			cst.setString(2, destwalletid);
			cst.setString(3, "cashback");
			cst.setInt(4,amount);
			cst.setString(5,email);
			cst.execute();
			sendemail eml = new sendemail("Crown Digital Wallet","CashBack","You have got 50Rs. cashback....",email);
			con.close();
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}
	

}
