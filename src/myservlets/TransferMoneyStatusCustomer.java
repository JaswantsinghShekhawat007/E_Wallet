package myservlets;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mybeans.AddCashBack;
import mybeans.DBConnector;
import mybeans.sendemail;

/**
 * Servlet implementation class TransferMoneyStatusCustomer
 */
@WebServlet("/TransferMoneyStatusCustomer")
public class TransferMoneyStatusCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TransferMoneyStatusCustomer() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(true);
		if(session.getAttribute("userid")!=null)
		{
		String srcwalletid = request.getParameter("srcwalletid");
		String destwalletid = request.getParameter("destwalletid");
		String amount = request.getParameter("amount");
		String email = request.getParameter("email");
		String srcname = request.getParameter("srcname");
		String status;
		Connection con;
		CallableStatement cst;
		PreparedStatement pst;
		ResultSet rs;
		try
		{
			DBConnector dbc = new DBConnector();
			con=dbc.getDbconnection();
			cst=con.prepareCall("{call trans(?,?,?,?,?)}");
			cst.setString(1, srcwalletid);
			cst.setString(2, destwalletid);
			cst.setString(3, "person");
			cst.setString(4,amount);
			cst.setString(5,email);
			cst.execute();
			pst=con.prepareStatement("select * from usersdata where walletid=?;");
			pst.setString(1, destwalletid);
			rs=pst.executeQuery();
			rs.next();
			if(Integer.parseInt(amount)>1000)
			{
				status=amount+"Rs. Transfer Successfully to "+rs.getString("name")+" And you have got 50Rs. Cashback";
				AddCashBack acb = new AddCashBack();
				acb.setEmail(email);
				acb.setSrcwalletid(srcwalletid);
				acb.setDestwalletid(destwalletid);
			}
			else
			{
				status=amount+"Rs. Transfer Successfully to "+rs.getString("name");
			}
			sendemail eml= new sendemail("Crown Digital Wallet","Money Transfer Details",amount+"Rs. is successfully transfered to "+rs.getString("name"),email);
			sendemail eml1= new sendemail("Crown Digital Wallet","Money Transfer Details",srcname+"(WalletID:"+srcwalletid+") tranfered you "+amount+"Rs.",rs.getString("email"));
			response.sendRedirect("customerprocess.jsp?type=transfermoneystatus&status="+status);
			con.close();
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		
	}
	else
	{
		response.sendRedirect("Failure.jsp?status=sessionexpired");
	}

}}
