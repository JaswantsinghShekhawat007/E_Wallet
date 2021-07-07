package mybeans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import myentities.Transactions;

public class TransactionsOperations 
{
	private String walletid;
	private String startdt;
	private String enddt; 
	private String destwalletid;
	
	public TransactionsOperations()
	{
		walletid="";
		startdt="";
		enddt="";
		destwalletid="";
	}

	public void setStartdt(String startdt) {
		this.startdt = startdt;
	}



	public void setEnddt(String enddt) {
		this.enddt = enddt;
	}



	public void setDestwalletid(String destwalletid) {
		this.destwalletid = destwalletid;
	}

	public void setWalletid(String walletid) {
		this.walletid = walletid;
	}
	
	public ArrayList<Transactions> transactionreport()
	{
		ArrayList<Transactions> trplist = new ArrayList<Transactions>();
		Transactions tr;
		
		Connection con;
		PreparedStatement pst;
		ResultSet rs;
		
		try
		{
			DBConnector dbc = new DBConnector();
			con=dbc.getDbconnection();
			pst=con.prepareStatement("select acctransactions.transno,acctransactions.transdt,acctransactions.srcwalletid,acctransactions.destwalletid,acctransactions.transactiontype,acctransactions.amount,usersdata.name from acctransactions left join usersdata on acctransactions.destwalletid = usersdata.walletid where acctransactions.srcwalletid=? or acctransactions.destwalletid=? order by acctransactions.transdt desc;");
			pst.setString(1, walletid);
			pst.setString(2, walletid);
			rs=pst.executeQuery();
			while(rs.next())
			{
				tr = new Transactions();
				tr.setTransno(rs.getInt("transno"));
				tr.setTransdt(rs.getString("transdt"));
				tr.setSrcwalletid(rs.getString("srcwalletid"));
				tr.setDestwalletid(rs.getString("destwalletid"));
				tr.setTransactiontype(rs.getString("transactiontype"));
				tr.setAmount(rs.getDouble("amount"));
				tr.setName(rs.getString("name"));
				trplist.add(tr);
			}
			
		}
		catch (Exception e) {
			// TODO: handle exception
			System.out.print(e);
		}
		
		return trplist;
	}
	
	public ArrayList<Transactions> transactionreportbydate()
	{
		ArrayList<Transactions> trplist1 = new ArrayList<Transactions>();
		Transactions tr;

		Connection con;
		PreparedStatement pst;
		ResultSet rs,rs1;
		
		try
		{
			DBConnector dbc = new DBConnector();
			con=dbc.getDbconnection();
			pst=con.prepareStatement("select * from acctransactions where transdt between ? and ?;");
			pst.setString(1, startdt);
		
			pst.setString(2, enddt);
			rs=pst.executeQuery();
			
			while(rs.next())
			{
				
				if((rs.getString("srcwalletid").equals(walletid)) || rs.getString("destwalletid").equals(walletid))
				{
					
				tr = new Transactions();
				tr.setTransno(rs.getInt("transno"));
				tr.setTransdt(rs.getString("transdt"));
				tr.setSrcwalletid(rs.getString("srcwalletid"));
				tr.setDestwalletid(rs.getString("destwalletid"));
				tr.setTransactiontype(rs.getString("transactiontype"));
				tr.setAmount(rs.getDouble("amount"));
				pst=con.prepareStatement("select name from usersdata where walletid=?;");
				pst.setString(1,walletid);
				rs1=pst.executeQuery();
				rs1.next();
				tr.setName(rs1.getString("name"));
				trplist1.add(tr);
				}
			}
			
		}
		catch (Exception e) {
			// TODO: handle exception
			System.out.print(e.getMessage());
		}
		
		return trplist1;
		
	}
	
	
	public ArrayList<Transactions> transactionreportbywalletid()
	{
		ArrayList<Transactions> trplist = new ArrayList<Transactions>();
		Transactions tr;
		
		Connection con;
		PreparedStatement pst;
		ResultSet rs;
		
		try
		{
			DBConnector dbc = new DBConnector();
			con=dbc.getDbconnection();
			pst=con.prepareStatement("select acctransactions.transno,acctransactions.transdt,acctransactions.srcwalletid,acctransactions.destwalletid,acctransactions.transactiontype,acctransactions.amount,usersdata.name from acctransactions left join usersdata on acctransactions.destwalletid = usersdata.walletid where acctransactions.srcwalletid=? and acctransactions.destwalletid=? order by acctransactions.transdt desc;");
			pst.setString(1, walletid);
			pst.setString(2, destwalletid);
			rs=pst.executeQuery();
			while(rs.next())
			{
				tr = new Transactions();
				tr.setTransno(rs.getInt("transno"));
				tr.setTransdt(rs.getString("transdt"));
				tr.setSrcwalletid(rs.getString("srcwalletid"));
				tr.setDestwalletid(rs.getString("destwalletid"));
				tr.setTransactiontype(rs.getString("transactiontype"));
				tr.setAmount(rs.getDouble("amount"));
				tr.setName(rs.getString("name"));
				trplist.add(tr);
			}
			
		}
		catch (Exception e) {
			// TODO: handle exception
			System.out.print(e);
		}
		
		return trplist;
	}
	

}
