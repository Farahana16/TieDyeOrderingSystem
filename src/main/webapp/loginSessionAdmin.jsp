<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@page import="java.sql.*" %>
<%@page import="java.util.*"%>
<%@page import="adminregister.db.ConnectionManager"%>
<%@page import="adminregister.model.adminregister"%>
<!DOCTYPE html>
<html>
	<body>
		<%
			String username = request.getParameter("username");
			String pass = request.getParameter("pass");
			try{ 
				//load the driver class  
				Class.forName("oracle.jdbc.driver.OracleDriver"); 
				
				//create the connection object 
				Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE ", "tco","system"); 
				//create the statement object 
				Statement stmt=con.createStatement(); 
				String sql = "SELECT * FROM admin WHERE adminusername = '" + username + "' AND adminpwd = '" + pass + "'";
				
				//execute query 
				ResultSet rs=stmt.executeQuery(sql); 
				//processing resultset - iterate
				if(rs.next()){
					
					response.sendRedirect("adminDashboard.jsp");
					int adminid = rs.getInt("adminid");
					session.setAttribute("SES_ID",adminid);
				}
				else {
					request.setAttribute("error", "Wrong username or password. Try Again");
					RequestDispatcher rd = request.getRequestDispatcher("adminIndex.jsp"); 
					rd.include(request, response);
				} 
				con.close(); 
			}
			catch(Exception e){ 
				System.out.println(e); 
			} 
		%>
	</body>
</html>