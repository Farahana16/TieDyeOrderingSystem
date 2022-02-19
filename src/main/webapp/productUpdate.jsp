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
			
			<form class="form-detail" action="updateProduct.jsp" method="post" id="myform">
				<div class="form-right">
					<h2>Update Product Details</h2>
					
					<input type="hidden" name="productid" value="<%=resultSet.getInt("productid") %>">
					
					<div class="form-row">
						<input type="text" name="productname" class="street" id="productname" value="<%=resultSet.getString("productname")%>" required>
					</div>

					<div class="form-row">
						<input type="text" name="productsize" class="additional" id="productsize" value="<%=resultSet.getString("productsize") %>" required>
					</div>

					<div class="form-row">
						<input type="text" name="productprice" class="additional" id="productprice" value="<%=resultSet.getInt("productprice") %>" required>
					</div>

					<div class="form-row">
						<input type="text" name="productdesc" class="additional" id="productdesc" value="<%=resultSet.getString("productdesc") %>" required>
					</div>
					
					<div class="form-row">
						<input type="text" name="productimages" class="additional" id="productdesc" value="<%=resultSet.getString("productimages") %>" required>
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