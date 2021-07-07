package mybeans;

import java.sql.*;

public class BankDetails 
{
	private int accno;
	private String bankname;
	private String name;
	private String email;
	private double balance;
	private String userid;
	
	public BankDetails()
	{
		accno=0;
		bankname="";
		name="";
		email="";
		balance=0;
		userid="";
	}
	
	

	public void setUserid(String userid) {
		this.userid = userid;
		generatedetails();
	}



	public int getAccno() {
		return accno;
	}

	public String getBankname() {
		return bankname;
	}

	public String getName() {
		return name;
	}

	public String getEmail() {
		return email;
	}

	public double getBalance() {
		return balance;
	}
	
	private void generatedetails()
	{
		Connection con;
		PreparedStatement pst;
		ResultSet rs,rs1;
		try
		{
			DBConnector dbc = new DBConnector();
			con=dbc.getDbconnection();
			pst=con.prepareStatement("select * from usersdata where userid=?;");
			pst.setString(1,userid);
			rs=pst.executeQuery();
			if(rs.next())
			{
				pst=con.prepareStatement("select * from bankaccount where accountno=?;");
				pst.setString(1,rs.getString("bankaccount"));
				rs1 = pst.executeQuery();
				rs1.next();
				accno=rs1.getInt("accountno");
				bankname=rs1.getString("bankname");
				name=rs1.getString("name");
				email=rs1.getString("email");
				balance=rs1.getDouble("balance");
			}
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
			
			
	}

}
