<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
		<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
		<%@ page import="java.sql.*" %>
		<%@ page import="java.io.*" %>
		<%@page import="java.sql.DriverManager"%>
		<%@page import="java.sql.ResultSet"%>
		<%@page import="java.sql.Statement"%>
		<%@page import="java.sql.Connection"%>
		<%
		String productid = request.getParameter("productid");
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
	<title>Product List</title>
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
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/mainAdmin.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
    
    /* Style buttons */
	.btn {
	  background-color: DodgerBlue; /* Blue background */
	  border: none; /* Remove borders */
	  color: white; /* White text */
	  padding: 12px 16px; /* Some padding */
	  font-size: 16px; /* Set a font size */
	  cursor: pointer; /* Mouse pointer on hover */
	}
	
	/* Darker background on mouse-over */
	.btn:hover {
	  background-color: RoyalBlue;
	}

  .button {
  background-color: #4CAF50; /* Green */
  border: none;
  color: white;
  padding: 16px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  transition-duration: 0.4s;
  cursor: pointer;
}

    </style>
</head>
<body>
	
	 <!--Header-->
    <div class="header">
        <a href="#default" class="logo">TakaCastOff</a>
        <div class="header-right">
          <a href="adminDashboard.jsp">Home</a>
          <a href="productTable.jsp">Product</a>
          <a href="orderTable.jsp">Order</a>
          <a href="feedbackTable.jsp">Feedback</a>
          <a href="adminIndex.html">Logout</a>
        </div>
      </div>
	
	<div class="limiter">
		<div class="container-table100">
			<div class="wrap-table100">
				<div class="table100">
				
								
					<table>
						<thead>
							<tr class="table100-head">
								<th class="column2">Id</th>
								<th class="column2">Date</th>
								<th class="column2">Total Price</th>
								<th class="column2">Customer</th>
								<th class="column3">Admin</th>
								<th class="column4">#</th>
							</tr>
						</thead>
						<tbody>
						<%
						try{
						connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE ", "tco","system");
						statement=connection.createStatement();
						String sql ="select * from ordert";
						resultSet = statement.executeQuery(sql);
						while(resultSet.next()){
						%>
								<tr>
									<td class="column2"><%=resultSet.getString("orderid") %></td>
									<td class="column2"><%=resultSet.getString("orderdate") %></td>
									<td class="column2"><%=resultSet.getString("ordertotalprice") %></td>
									<td class="column2"><%=resultSet.getInt("custid") %></td>
									<td class="column3"><%=resultSet.getString("adminid") %></td>
									<td class="column4">
										<a href="orderUpdate.jsp?orderid=<%=resultSet.getString("orderid") %>"><button class="btn"><i class="fa fa-pencil"></i></button></a>
									</td>
								</tr>
						<%
						}
						connection.close();
						} catch (Exception e) {
						e.printStackTrace();
						}
						%>
						</tbody>
					</table>
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