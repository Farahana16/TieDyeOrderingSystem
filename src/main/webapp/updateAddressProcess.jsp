<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="db.ConnectionManager" %>
<%
	String address = request.getParameter("address");
	String city = request.getParameter("city");
	String state = request.getParameter("state");
	int poscode = Integer.parseInt(request.getParameter("poscode"));
	
	int billingID = Integer.parseInt(request.getParameter("billingID"));
	int shippingID = Integer.parseInt(request.getParameter("shippingID"));
		
	Connection con = ConnectionManager.getConnection();
	PreparedStatement ps = null;
	try
	{
		if(billingID != 0){
			String sql = "Update billingaddress set custbillingAddress=?, custbillingCity=?, custbillingState=?, custbillingPoscode=? where billingID=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, address);
			ps.setString(2, city);
			ps.setString(3, state);
			ps.setInt(4, poscode);
			ps.setInt(5, billingID);
			
			int i = ps.executeUpdate();
			response.sendRedirect("billingAddress.jsp");
		}
		else if (shippingID != 0) {
			String sql = "Update shippingaddress set custshippingAddress=?, custshippingCity=?, custshippingState=?, custshippingPoscode=? where shippingID=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, address);
			ps.setString(2, city);
			ps.setString(3, state);
			ps.setInt(4, poscode);
			ps.setInt(5, shippingID);
			
			int i = ps.executeUpdate();
			response.sendRedirect("shippingAddress.jsp");
		}
	} catch(SQLException sql) {
		request.setAttribute("error", sql);
		out.println(sql);
	  }
	%>