<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%@page import="db.ConnectionManager"%>
<%
	String feedbackid=request.getParameter("feedbackid");
	try
	{
	Connection conn = ConnectionManager.getConnection();
	Statement st=conn.createStatement();
	int i=st.executeUpdate("DELETE FROM feedback WHERE feedbackid="+feedbackid);
	response.sendRedirect("feedbackTable.jsp");
	}
	catch(Exception e)
	{
	System.out.print(e);
	e.printStackTrace();
	}
%>
