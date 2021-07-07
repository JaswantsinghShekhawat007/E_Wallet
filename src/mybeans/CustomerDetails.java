package mybeans;

import java.sql.*;

public class CustomerDetails 
{
	private String userid; 
	private String name;
	private String email;
	private String mobileno;
	private String secques;
	private String secans;
	private String dt;
	private String walletid;
	private String bankaccount;
	private String balance;
	
	public CustomerDetails()
	{
		userid="";
		name="";
		email="";
		mobileno="";
		secques="";
		secans="";
		dt="";
		walletid="";
		bankaccount="";
		balance="";
	}

	public String getName() {
		return name;
	}

	public String getEmail() {
		return email;
	}

	public String getMobileno() {
		return mobileno;
	}

	public String getSecques() {
		return secques;
	}

	public String getSecans() {
		return secans;
	}

	public String getDt() {
		return dt;
	}

	public String getWalletid() {
		return walletid;
	}

	public String getBankaccount() {
		return bankaccount;
	}

	public String getBalance() {
		return balance;
	}

	public void setUserid(String userid) {
		this.userid = userid;
		getData();
	}
	
	
	

	private void getData()
	{
		Connection con;
		PreparedStatement pst;
		ResultSet rs;

		try
		{
			DBConnector dbc = new DBConnector();
			con=dbc.getDbconnection();
			pst=con.prepareStatement("select * from usersdata where userid=?;");
			pst.setString(1, userid);
			rs=pst.executeQuery();
			if(rs.next())
			{
				name=rs.getString("name");
				email=rs.getString("email");
				mobileno=rs.getString("mobileno");
				secques=rs.getString("secquestion");
				secans=rs.getString("secans");
				dt=rs.getString("dt");
				walletid=rs.getString("walletid");
				bankaccount=rs.getString("bankaccount");
				balance=rs.getString("balance");
				
			}
			con.close();
			
		}
		catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		
	}
	
	
	

}
