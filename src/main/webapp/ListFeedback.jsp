<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
		<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
		<%@ page import="java.sql.*" %>
		<%@ page import="java.io.*" %>
		<%@page import="java.sql.DriverManager"%>
		<%@page import="java.sql.ResultSet"%>
		<%@page import="java.sql.Statement"%>
		<%@page import="java.sql.Connection"%>
		<%@page import="db.ConnectionManager" %>
		<%
		
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null; 
		String image = null;
		%>
<html>
<head>
<title>Feedback List</title>
<link rel="stylesheet" href="css/styleFeed.css">
</head>
<body>
	<%int custID = Integer.parseInt(request.getParameter("custID")); %>
	<div class="topnav">
  <div class="topnav-left">
    <a id="left" class="active" href="Homepage.jsp?custID=<%=custID%>">Home</a> 
    <a id="left" href="listFeedController">List</a>
  </div>
</div><br>

	<h3>Review</h3>
	  <button style="float: center;"onclick="window.location.href ='addFeedback.jsp';">Review here </button>
	
	<div class="tableList">
	
	<table>	
	<thead>	
	  <tr>
	    <th>Review</th>
	    <th>Actions</th>
	  </tr>
	  </thead>
	  <tbody>
	  <%
	   try{
	   connection =  ConnectionManager.getConnection();   
	   statement=connection.createStatement();
	   String sql ="select * from feedbacks";
	   resultSet = statement.executeQuery(sql);
	   while(resultSet.next()){
	  %>
	  <tr>
	    <td><%=resultSet.getString("feedbackrating") %><br>
	    <%=resultSet.getString("feedbackcomment") %></td>
	    <td><a href="deleteFeedbackc.jsp?custID=<%=custID%>&feedbackid=<%=resultSet.getInt("feedbackid") %>">Delete</a></td>
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
</body>
</html>
