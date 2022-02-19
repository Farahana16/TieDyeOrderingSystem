<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
		<%
		session.getAttribute("SES_ID");
		String adminid = request.getParameter("SES_ID");
		String orderid = request.getParameter("orderid");
		String driver = "oracle.jdbc.driver.OracleDriver";
		String connectionUrl = "jdbc:oracle:thin:@localhost:1521:XE";
		String database = "tco";
		String userid = "tco";
		String password = "system";
		try {
		Class.forName(driver);
		} catch (ClassNotFoundException e) {
		e.printStackTrace();
		}
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
		%>
		<%
		try{
		connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE ", "tco","system");
		statement=connection.createStatement();
		String sql ="select * from ordert where orderid="+orderid;
		resultSet = statement.executeQuery(sql);
		while(resultSet.next()){
		%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Product Update</title>
	<!-- Mobile Specific Metas -->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<!-- Font-->
	<link rel="stylesheet" type="text/css" href="css/montserrat-font.css">
	<link rel="stylesheet" type="text/css" href="fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">
	<!-- Main Style Css -->
    <link rel="stylesheet" href="css/styleUpdate.css"/>
</head>
<body class="form-v10">
	<div class="page-content">
		<div class="form-v10-content">
			
			<form class="form-detail" action="updateOrder.jsp" method="post" id="myform">
				<div class="form-right">
					<h2>Update Product Details</h2>
					
					
					
					<div class="form-row">
						<input type="hidden" name="orderid" class="street" id="orderid" value="<%=resultSet.getString("orderid")%>" >
					</div>

					<div class="form-row">
						<input type="text" name="orderdate" class="additional" id="orderdate" value="<%=resultSet.getString("orderdate") %>" required>
					</div>

					<div class="form-row">
						<input type="text" name="ordertotalprice" class="additional" id="ordertotalprice" value="<%=resultSet.getInt("ordertotalprice") %>" required>
					</div>

					<div class="form-row">
						<input type="text" name="custid" class="additional" id="productdesc" value="<%=resultSet.getString("custid") %>" readonly>
					</div>
					
					<div class="form-row">
						<input type="text" name="adminid" class="additional" id="productdesc" value="<%=session.getAttribute("SES_ID") %>" required>
					</div>

					<div class="form-row-last" >
						<input type="submit" name="register" class="register" value="Update Product">
					</div>

				</div>
			</form>
			
			<%
			}
			connection.close();
			} catch (Exception e) {
			e.printStackTrace();
			}
			%>
			
		</div>
	</div>
</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>