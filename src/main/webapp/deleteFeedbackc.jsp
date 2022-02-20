<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%@page import="db.ConnectionManager" %>
<%
	int feedbackid=Integer.parseInt(request.getParameter("feedbackid"));
	int custID = Integer.parseInt(request.getParameter("custID"));
	try
	{
	
	Connection conn = ConnectionManager.getConnection();   
	Statement st=conn.createStatement();
	int i=st.executeUpdate("DELETE FROM feedbacks WHERE feedbackid="+feedbackid);
	response.sendRedirect("ListFeedback.jsp?custID="+custID);
	}
	catch(Exception e)
	{
	System.out.print(e);
	e.printStackTrace();
	}
%>
