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
@WebServlet("/Regcompany")
public class Regcompany extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Regcompany() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String userid = request.getParameter("userid");
		String companyname = request.getParameter("name");
		String companytype = request.getParameter("cmptype");
		String pswd = request.getParameter("pswd");
		Connection con;
		CallableStatement cst;
		try
		{
			DBConnector dbc = new DBConnector();
			con=dbc.getDbconnection();
			cst=con.prepareCall("{call RegisterCompanyLogin(?,?,?,?)}");
			cst.setString(1,userid);
			cst.setString(2,pswd);
			cst.setString(3,companyname);
			cst.setString(4,companytype);
			
			cst.execute();
			response.sendRedirect("UploadlogoCompany.jsp?userid="+userid);
			con.close();
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		
	}

}
