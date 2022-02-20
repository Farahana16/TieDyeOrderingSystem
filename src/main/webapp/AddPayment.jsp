<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import = "java.sql.*" %>
<%@page import= "db.ConnectionManager"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Insert title here</title>
</head>
<body>
         <%
         	 double totprice = Double.parseDouble(request.getParameter("paymentTotalPrice"));
         	 String date = request.getParameter("paymentDate");
         	 String pm = request.getParameter("paymentMethod");
           	 int oid = Integer.parseInt(request.getParameter("orderID"));
           	 int custID = Integer.parseInt(request.getParameter("custID"));
        	 
           	 try{
        		Connection con = ConnectionManager.getConnection();              

           	 	PreparedStatement ps = con.prepareStatement("insert into payment(paymentTotalPrice, paymentDate, paymentMethod, orderID)values(?,to_date(SYSDATE),?,?)");          	 
        		ps.setDouble(1,totprice);
        		ps.setString(2,pm);
        		ps.setInt(3,oid);
        		
        		ps.executeUpdate();	
        		con.close();
        		
        		response.sendRedirect("invoice.jsp?custID=" + custID + "&orderID=" + oid);
           	 }catch(Exception e){
           		 out.println(e);
           	 }
           	 
         %>               		

</body>
</html>
