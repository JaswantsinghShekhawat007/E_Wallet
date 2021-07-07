package myservlets;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybeans.DBConnector;

/**
 * Servlet implementation class RegOtpCheck
 */
@WebServlet("/RegOtpCheck")
public class RegOtpCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegOtpCheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String oriotp = request.getParameter("oriotp");
		String otp = request.getParameter("otp");
		if(oriotp.equals(otp))
		{
		String userid = request.getParameter("userid");
		String fullname = request.getParameter("name");
		String email = request.getParameter("email");
		String mobile = request.getParameter("mobile");
		String question = request.getParameter("question");
		String answer = request.getParameter("answer");
		String pswd = request.getParameter("pswd");
		Connection con;
		CallableStatement cst;
		try
		{
			DBConnector dbc = new DBConnector();
			con=dbc.getDbconnection();
			cst=con.prepareCall("{call RegisterLogin(?,?,?,?,?,?,?)}");
			cst.setString(1,userid);
			cst.setString(2,pswd);
			cst.setString(3,fullname);
			cst.setString(4,email);
			cst.setString(5,mobile);
			cst.setString(6,question);
			cst.setString(7,answer);
			cst.execute();
			response.sendRedirect("logincheck.jsp?userid="+userid+"&pswd="+pswd);
			con.close();
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		}
		else
		{
			response.sendRedirect("Failure.jsp?status=regotpwrong");
		}
	}

}
