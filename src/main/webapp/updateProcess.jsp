<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%
	String driver = "org.postgresql.Driver";
	String connectionUrl = "jdbc:postgresql://ec2-54-72-155-238.eu-west-1.compute.amazonaws.com:5432/";
	String database = "d3lt7uttu2s0h3";
	String userid = "yyehssgxzsdqki";
	String password = "9e580d650d0f1be9f361083b5a0741807d83c7d92a887482a0630f19cd2dc9c3";
	String custID = request.getParameter("custID");
	String custPwd=request.getParameter("custPwd");
	String custPhoneNum=request.getParameter("custPhoneNum");
	String custEmail = request.getParameter("custEmail");
	String custUsername=request.getParameter("custUsername");
	if(custID != null){
		Connection con = null;
		PreparedStatement ps = null;
		int personID = Integer.parseInt(custID);
		try{
			Class.forName(driver);
			con = DriverManager.getConnection("jdbc:postgresql://ec2-54-72-155-238.eu-west-1.compute.amazonaws.com:5432/d3lt7uttu2s0h3", "yyehssgxzsdqki","9e580d650d0f1be9f361083b5a0741807d83c7d92a887482a0630f19cd2dc9c3");
			String sql="Update customers set custUsername=?,custPhoneNum=?,custPwd=?,custEmail=? where custID="+custID;
			ps = con.prepareStatement(sql);
			
			ps.setString(1, custUsername);
			ps.setString(2, custPhoneNum);
			ps.setString(3, custPwd);
			ps.setString(4, custEmail);
			int i = ps.executeUpdate();
			if(i > 0){
		    response.sendRedirect("displayUpdate.jsp");
		    //out.print("Record Updated Successfully");
			}
			else{
				out.print("There is a problem in updating Record.");
			}
		}
		catch(SQLException sql){
			request.setAttribute("error", sql);
			out.println(sql);
		}
	}
%>
