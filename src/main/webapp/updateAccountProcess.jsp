<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="db.ConnectionManager" %>
<%
	String username = request.getParameter("custUsername");
	String email = request.getParameter("custEmail");
	String phonenum = request.getParameter("custPhoneNum");
	String pwd = request.getParameter("custPwd");
		
	Connection con = ConnectionManager.getConnection();
	PreparedStatement ps = null;
	try
	{
	
		String sql = "Update customer set custUsername=?, custEmail=?, custPhoneNum=?, custPwd=? where custid="+session.getAttribute("SES_ID");
		ps = con.prepareStatement(sql);
		ps.setString(1, username);
		ps.setString(2, email);
		ps.setString(3, phonenum);
		ps.setString(4, pwd);
		
		int i = ps.executeUpdate();
		
		if(i > 0){
			response.sendRedirect("UpdateAccount.jsp");
		}
		else{
			out.print("There is a problem in updating Record.");
		}
	} catch(SQLException sql) {
		request.setAttribute("error", sql);
		out.println(sql);
	  }
	%>