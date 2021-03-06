<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%@page import="db.ConnectionManager" %>    
<%
	Connection con  = null;
	Statement statement = null;
	ResultSet resultSet, rs = null;

%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Tie Dye Checkout</title>
	<link rel="stylesheet" href="css/checkout.css">
</head>
<body>
	<%
		//int custID = Integer.parseInt(request.getParameter("custID"));
		double totalPrice = Double.parseDouble(request.getParameter("totalPrice"));
		int custID = Integer.parseInt(request.getParameter("custID"));
		int orderID = 0;
		try{
			con = ConnectionManager.getConnection();
			PreparedStatement ps = con.prepareStatement("INSERT INTO orderr(ordedate, ordertotalprice, custid) VALUES (SYSDATE(),?,?)");   
			ps.setDouble(1,totalPrice);
			ps.setInt(2,custID);
			ps.executeUpdate();
			
			statement = con.createStatement();
			String sql = "SELECT LAST_INSERT_ID() as orderID";
			resultSet = statement.executeQuery(sql);
			if(resultSet.next()){
				orderID = resultSet.getInt("orderID");
			}
			
			 
			statement = con.createStatement();
			sql = "SELECT productid from cartitems WHERE custid ='"+custID+"'";
			resultSet = statement.executeQuery(sql);
			
			while(resultSet.next()){
				int productid = resultSet.getInt("productid");
				ps = con.prepareStatement("INSERT INTO orderdetails(productid, orderid) VALUES(?,?)");
				ps.setInt(1, productid);
				ps.setInt(2, orderID);
				ps.executeUpdate();
			}
			
			ps = con.prepareStatement("DELETE FROM CARTITEMS WHERE CUSTID ='"+custID+"'"); 
			ps.executeUpdate();
			
			response.sendRedirect("Payment.jsp?orderID=" + orderID +"&custID=" +custID);
		}catch(Exception e){
				System.out.println(e);
		}
	%>
</body>
</html>
