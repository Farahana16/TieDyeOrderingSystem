<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<%@page import="db.ConnectionManager" %>
<%
	int orderid = Integer.parseInt(request.getParameter("orderid"));
	String orderdate=request.getParameter("orderdate");
	int ordertotalprice=Integer.parseInt(request.getParameter("ordertotalprice"));
	int custid=Integer.parseInt(request.getParameter("custid"));
	int adminid=Integer.parseInt(request.getParameter("adminid"));
	Connection con = null;
	PreparedStatement ps = null;
	try
	{
	
	Connection con = ConnectionManager.getConnection();  
	String sql="Update orderr set orderid=?,orderdate=TO_DATE(?,'YYYY-MM-DD HH24:MI:SS'),ordertotalprice=?,custid=?,adminid=? where orderid="+orderid;
	ps = con.prepareStatement(sql);
	ps.setInt(1,orderid);
	ps.setString(2, orderdate);
	ps.setInt(3, ordertotalprice);
	ps.setInt(4, custid);
	ps.setInt(5, adminid);
	int i = ps.executeUpdate();
	if(i > 0)
	{
		response.sendRedirect("orderTable.jsp");
	}
	else
	{
	out.print("There is a problem in updating Record.");
	}
	}
	catch(SQLException sql)
	{
	request.setAttribute("error", sql);
	out.println(sql);
	}
	%>
