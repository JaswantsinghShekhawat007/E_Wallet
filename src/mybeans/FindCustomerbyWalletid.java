package mybeans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class FindCustomerbyWalletid 
{
	private String walletid;
	private String name;
	
	public FindCustomerbyWalletid()
	{
		walletid="";
		name="";
	}

	public String getName() {
		return name;
	}

	public void setWalletid(String walletid) {
		this.walletid = walletid;
		findName();
	}
	
	private void findName()
	{
		Connection con;
		PreparedStatement pst;
		ResultSet rs;
		try 
		{
			DBConnector dbc = new DBConnector();
			con=dbc.getDbconnection();
			pst=con.prepareStatement("select * from usersdata where walletid=?");
			pst.setString(1,walletid);
			rs=pst.executeQuery();
			if(rs.next())
			{
				name=rs.getString("name");
			}
			
		}
		catch (Exception e) 
		{
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		
	}

}
