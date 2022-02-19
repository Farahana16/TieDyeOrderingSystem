<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
	String orderid=request.getParameter("orderid");
	try
	{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE ", "tco","system");
	Statement st=conn.createStatement();
	int i=st.executeUpdate("DELETE FROM ordert WHERE orderid="+orderid);
	response.sendRedirect("orderTable.jsp");
	}
	catch(Exception e)
	{
	System.out.print(e);
	e.printStackTrace();
	}
%>