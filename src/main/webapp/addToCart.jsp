<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@page import="java.sql.*" %>
<%@page import="db.ConnectionManager"%>


<!DOCTYPE html>
<html>
	<body>
		<%
			String driver = "oracle.jdbc.driver.OracleDriver";
			String connectionUrl = "jdbc:oracle:thin:@localhost:1521:XE ";
			String userid = "taka2";
			String password = "system";
			try{  				
				//create the connection object 
				Connection con = DriverManager.getConnection(); 
				int productID = Integer.parseInt(request.getParameter("productID"));
				int custID = Integer.parseInt(request.getParameter("custID")); 
		
				//create the statement object 
				PreparedStatement ps = con.prepareStatement("INSERT INTO CARTITEMS(productID,custID) VALUES (?,?)");
				ps.setInt(1, productID);
				ps.setInt(2,custID);
				
				//execute query 
				ps.executeUpdate(); 
				response.sendRedirect("Homepage.jsp?custID=" + custID);

				con.close(); 
			}
			catch(Exception e){ 
				System.out.println(e);  
			} 
		%>
	</body>
</html>
