<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="db.ConnectionManager" %>
<%
	String address = request.getParameter("address");
	String city = request.getParameter("city");
	String state = request.getParameter("state");
	int poscode = Integer.parseInt(request.getParameter("poscode"));
	
	String billing = request.getParameter("billing");
	String shipping = request.getParameter("shipping");
		
	Connection con = ConnectionManager.getConnection();
	PreparedStatement ps = null;
	try
	{
		if(billing != null){
			String sql = "insert into billingaddress(custbillingAddress, custbillingCity, custbillingState, custbillingPoscode, custID) values (?,?,?,?,'"+session.getAttribute("SES_ID")+"')";
			ps = con.prepareStatement(sql);
			ps.setString(1, address);
			ps.setString(2, city);
			ps.setString(3, state);
			ps.setInt(4, poscode);
			
			int i = ps.executeUpdate();
			response.sendRedirect("billingAddress.jsp");
		}
		else if (shipping != null) {
			String sql = "insert into shippingaddress(custshippingAddress, custshippingCity, custshippingState, custshippingPoscode, custID) values (?,?,?,?,'"+session.getAttribute("SES_ID")+"')";
			ps = con.prepareStatement(sql);
			ps.setString(1, address);
			ps.setString(2, city);
			ps.setString(3, state);
			ps.setInt(4, poscode);
			
			int i = ps.executeUpdate();
			response.sendRedirect("shippingAddress.jsp");
		}
	} catch(SQLException sql) {
		request.setAttribute("error", sql);
		out.println(sql);
	  }
	%>