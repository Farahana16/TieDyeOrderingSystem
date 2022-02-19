<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
		<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
		<%@ page import="java.sql.*" %>
		<%@ page import="java.io.*" %>
		<%@page import="java.sql.DriverManager"%>
		<%@page import="java.sql.ResultSet"%>
		<%@page import="java.sql.Statement"%>
		<%@page import="java.sql.Connection"%>
		<%
		String adminid = request.getParameter("adminid");
		String driver = "oracle.jdbc.driver.OracleDriver";
		String connectionUrl = "jdbc:oracle:thin:@localhost:1521:XE ";
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
<html lang="en">
<head>
	<title>TCO</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/utilAdmin.css">
	<link rel="stylesheet" type="text/css" href="css/mainAdmin.css">
<!--===============================================================================================-->

<style>
    * {box-sizing: border-box;}
    
    body { 
      margin: 0;
      font-family: Arial, Helvetica, sans-serif;
    }
    
    .header {
      overflow: hidden;
      background-color: #000000;
      padding: 5px 5px;
    }
    
    .header a {
      float: left;
      color: rgb(255, 255, 255);
      text-align: center;
      padding: 12px;
      text-decoration: none;
      font-size: 18px; 
      line-height: 25px;
      border-radius: 4px;
    }
    
    .header a.logo {
      font-size: 25px;
      font-weight: bold;
    }
    
    .header a:hover {
      background-color: #ddd;
      color: black;
    }
    
    .header a.active {
      background-color: rgb(163, 201, 238);
      color: white;
    }
    
    .header-right {
      float: right;
    }
    
    @media screen and (max-width: 500px) {
      .header a {
        float: none;
        display: block;
        text-align: left;
      }
      
      .header-right {
        float: none;
      }
    }
    </style>
</head>
<body>
	<%
						try{
						connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE ", "tco","system");
						statement=connection.createStatement();
						String sql ="select * from ordert";
						resultSet = statement.executeQuery(sql);
						if(resultSet.next()){
						%>
    <!--Header-->
    <div class="header">
        <a href="adminDashboard.jsp" class="logo">TakaCastOff</a>
        <div class="header-right">
          <a href="adminDashboard.jsp">Home</a>
          <a href="productTable.jsp">Product</a>
          <a href="orderTable.jsp?orderid=<%=resultSet.getString("orderid") %>">Order</a>
          <a href="feedbackTable.jsp">Feedback</a>
          <a href="adminIndex.html">Logout</a>
        </div>
      </div>
	<%
						}
						connection.close();
						} catch (Exception e) {
						e.printStackTrace();
						}
						%>
	<div class="limiter">
		<div class="container-table100">
			<div class="wrap-table100">
				<div class="table100">
					
				</div>
			</div>
		</div>
	</div>


	

<!--===============================================================================================-->	
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>

</body>
</html>