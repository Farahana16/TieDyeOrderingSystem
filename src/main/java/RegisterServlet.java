import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;


@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet 
{ 
     private static final long serialVersionUID =1L;
     
     public RegisterServlet() {
    	 super();
     }
     protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 		// TODO Auto-generated method stub
         response.getWriter().append("Served at: ").append(request.getContextPath());
 		
 	}
     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
     {
    	 doGet(request, response);
    	 
    	 //retrieve
    	 String username = request.getParameter("username");
    	 String email = request.getParameter("email");
    	 String password = request.getParameter("password");
    	 String Cpassword = request.getParameter("Cpassword");
         
    	 response.setContentType("text/html");  
    	 
    	 PrintWriter out = response.getWriter();
    	 //print
    	 out.println("<!DOCTYPE html><html><body>");
    	 out.println("Username: "+ username + "<br>");
    	 out.println("Email: "+ email + "<br>");
    	 out.println("Password: "+ password + "<br>");
    	 out.println("Confirm Password: "+ Cpassword + "<br>");
    	 out.println("</body></html>");
    
 		try {

             Class.forName("org.postgresql.Driver");

             Connection conn = DriverManager.getConnection("jdbc:postgresql://ec2-52-44-31-100.compute-1.amazonaws.com:5432/dffi4qvj2t1gsg","zssxxvgezboosc","260fd48ce298fbfd1a64f11a94813c5489c0e65e5c5d3dafbfb139e813b1c462");

             Statement st = conn.createStatement();
            
             String sql = "insert into seller (sName, shopName, passw, sEmail, accNo, aID) values('"+username+"','-','"+password+"','"+email+"','-','-')";

             st.executeUpdate(sql);
             out.println("Data is Successfully Inserted into Seller Table");
                }
 		catch (ClassNotFoundException e) {

               e.printStackTrace();

         } catch (SQLException e) {

               e.printStackTrace();

          }
    	 
     }
}
