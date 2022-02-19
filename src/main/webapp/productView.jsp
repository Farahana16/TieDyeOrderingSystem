<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
		<%
		String productid = request.getParameter("productid");
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
		String image = null;
		%>
		<%
		try{
		connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE ", "tco","system");
		statement=connection.createStatement();
		String sql ="select * from product where productid="+productid;
		resultSet = statement.executeQuery(sql);
		while(resultSet.next()){
		%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Product View</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		
		<!-- MATERIAL DESIGN ICONIC FONT -->
		<link rel="stylesheet" href="fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">

		<!-- STYLE CSS -->
		<link rel="stylesheet" href="css/styleView.css">
	</head>

	<body>

		<div class="wrapper" style="background-image: url('images/bg4.jpg');">
			<div class="inner">
				<div class="image-holder">
					<% image = resultSet.getString("productimages"); %>
					<img src="<%=image%>" alt="image" style="width:600px; height:550px">
				</div>
				
				<div class="div1">
					<h3>Product Details</h3>
					<div class="form-wrapper">
						<p style="font-size:2vw">Name :  <%=resultSet.getString("productname")%></p>
						<br>
					</div>

					<div class="form-wrapper">
						<p style="font-size:2vw">Size :  <%=resultSet.getString("productsize") %></p>
						<br>
					</div>

					<div class="form-wrapper">
						<p style="font-size:2vw">Price :  RM  <%=resultSet.getInt("productprice") %></p>
						<br>
					</div>

					<div class="form-wrapper">
						<p style="font-size:2vw">Description :  <%=resultSet.getString("productdesc") %></p>
						<br>
					</div>

					<a href="productTable.jsp" style="color: aliceblue;"><button>Back<i class="zmdi zmdi-arrow-right" ></i></button></a>
				</div>
				
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