package admincontroller;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;
import java.sql.*;


@WebServlet("/signinController")
public class signinController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public signinController() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    
	@SuppressWarnings("null")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = null;
		String username = request.getParameter("username");
		String pass = request.getParameter("pass");
		
		PrintWriter out = response.getWriter();
		
		try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            
            Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE ", "tco","system");
            Statement st = conn.createStatement();
           
            String sql = "SELECT * FROM admin WHERE adminusername = '" + username + "' AND adminpwd = '" + pass + "'";
            ResultSet rs=st.executeQuery(sql); 
            if(rs.next()) {
            	int adminid = rs.getInt("adminid");
				session.setAttribute("SES_ID",adminid);
            	response.sendRedirect("adminDashboard.jsp");
            	
            }
            else {
            	out.println("Wrong username/password");
            	//response.sendRedirect("loginBuyer.jsp"); //patut ke buat new page? utk login kalau dia ada error, sbb ni nnti dia direct je hahaha
            }
            
        }
		
		catch (ClassNotFoundException e) {
			e.printStackTrace();
        } 
		
		catch (SQLException e) {
            e.printStackTrace();
        }
	}

}

   