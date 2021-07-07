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
 * Servlet implementation class FasttagRechargeStatusCustomer
 */
@WebServlet("/FasttagRechargeStatusCustomer")
public class FasttagRechargeStatusCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FasttagRechargeStatusCustomer() {
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
			String srcwalletid;
			String destwalletid = request.getParameter("company");
			String amount = request.getParameter("amount");
			String vehicleno=request.getParameter("vehicleno");
			String srcemail;
			String status;
			String userid=String.valueOf(session.getAttribute("userid"));
			Connection con;
			CallableStatement cst;
			PreparedStatement pst;
			ResultSet rs,rs1;
			try
			{
				DBConnector dbc = new DBConnector();
				con=dbc.getDbconnection();
				pst=con.prepareStatement("select * from usersdata where userid=?;");
				pst.setString(1, userid);
				rs=pst.executeQuery();
				rs.next();
				srcemail=rs.getString("email");
				srcwalletid=rs.getString("walletid");
				cst=con.prepareCall("{call trans(?,?,?,?,?)}");
				cst.setString(1, srcwalletid);
				cst.setString(2, destwalletid);
				cst.setString(3, "fasttag");
				cst.setString(4,amount);
				cst.setString(5,srcemail);
				cst.execute();
				pst=con.prepareStatement("select * from companydata where walletid=?;");
				pst.setString(1, destwalletid);
				rs1=pst.executeQuery();
				rs1.next();
			
				if(Integer.parseInt(amount)>1000)
				{
					status=amount+"Rs. fasttag recharge successfully completed through "+rs1.getString("companyname")+" Company on Number "+vehicleno+". And you have got 50Rs. Cashback";
					AddCashBack acb = new AddCashBack();
					acb.setEmail(srcemail);
					acb.setSrcwalletid(srcwalletid);
					acb.setDestwalletid(destwalletid);
				}
				else
				{
					status=amount+"Rs. mobile recharge successfully completed through "+rs1.getString("companyname")+" Company on Number "+vehicleno+".";
				}
				sendemail eml= new sendemail("Crown Digital Wallet","Money Transfer Details",amount+"Rs. fasttag recharge successfully completed through "+rs1.getString("companyname")+" Company on Number "+vehicleno+". Thank You",srcemail);
			
				response.sendRedirect("customerprocess.jsp?type=fasttagrechargestatus&status="+status);
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
	}

}
