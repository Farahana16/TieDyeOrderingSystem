<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%@page import="db.ConnectionManager" %>
<%
	String productid=request.getParameter("productid");
	try
	{
	Connection con = ConnectionManager.getConnection();    
	Statement st=conn.createStatement();
	int i=st.executeUpdate("DELETE FROM product WHERE productid="+productid);
	response.sendRedirect("productTable.jsp");
	}
	catch(Exception e)
	{
	System.out.print(e);
	e.printStackTrace();
	}
%>
