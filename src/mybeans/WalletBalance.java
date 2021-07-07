package mybeans;

import java.sql.*;

public class WalletBalance {
	
	private String walletid;
	private double balance;
	
	public WalletBalance(String walletid)
	{
		this.walletid=walletid;
		balance=0.0;
	}

	public double getBalance() {
		findbalancebyid();
		return balance;
	}
	
	private void findbalancebyid()
	{
		Connection con;
		PreparedStatement pst;
		ResultSet rs;
		try
		{
			DBConnector dbc = new DBConnector();
			con=dbc.getDbconnection();
			pst = con.prepareStatement("select balance from usersdata where walletid=?;");
			pst.setString(1, walletid);
			rs= pst.executeQuery();
			if(rs.next())
			{
				balance=rs.getDouble("balance");
			}
			con.close();
			
		}
		catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		
	}
	

}
