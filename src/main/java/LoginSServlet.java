

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
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginBServlet
 */
@WebServlet("/LoginSServlet")
public class LoginSServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginSServlet() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		PrintWriter out = response.getWriter();
		out.print("<!DOCTYPE html><html><body>");
		out.print("Username:" + email + "<br>");
		out.print("Password:"+ password + "<br>");
		
		out.print("</body></html>");
		
		try {
            Class.forName("org.postgresql.Driver");
            
            Connection conn = DriverManager.getConnection("jdbc:postgresql://ec2-52-44-31-100.compute-1.amazonaws.com:5432/dffi4qvj2t1gsg","zssxxvgezboosc","260fd48ce298fbfd1a64f11a94813c5489c0e65e5c5d3dafbfb139e813b1c462");
            Statement st = conn.createStatement();
           
            ResultSet sql = st.executeQuery("SELECT * FROM seller WHERE sEmail = '" + email + "' AND passw = '" + password + "'");
            if(sql.next()) {
            	response.sendRedirect("product.jsp");
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
