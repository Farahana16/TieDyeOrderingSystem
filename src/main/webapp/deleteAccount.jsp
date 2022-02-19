<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%@page import="db.ConnectionManager" %>
<%
	String productid=request.getParameter("productid");
	try {
		Connection conn = ConnectionManager.getConnection();
		Statement st=conn.createStatement();
		st.executeUpdate("DELETE FROM customer WHERE custid="+session.getAttribute("SES_ID"));
		response.sendRedirect("index.jsp");
	}catch(Exception e){
		System.out.print(e);
		e.printStackTrace();
	}
%>