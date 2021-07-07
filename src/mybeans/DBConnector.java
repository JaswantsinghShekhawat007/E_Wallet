package mybeans;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnector 
{
private Connection dbconnection;
	
	public DBConnector()
	{
	try
	{
		Class.forName("com.mysql.cj.jdbc.Driver");
		dbconnection=DriverManager.getConnection("jdbc:mysql://localhost:3306/ewalletdb?user=root&password=Pulsar");
	}
	catch(Exception e)
	{
	System.out.println(e);	
	}
	}

	public Connection getDbconnection() {
		return dbconnection;
	}
	

}
