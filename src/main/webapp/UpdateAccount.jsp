<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="db.ConnectionManager"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
 	<head>
	    <meta charset="UTF-8">    
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" href="css/UpdateAccount.css">
		<script>
	    	function updateAccount(){ 
	    		alert("Account Updated Successfully!")
	    	}
	    	
	    	function deleteAccount(){
	    		alert("Account Deleted")
	    	}
	    </script>  
	</head>
	<body>
        <div class="container">
          <div class="title" style="text-align:center;">Update Profile</div>
		    <div class="row">
			    <div class="column">
			     	 <%
		      			//String ID = session.getAttribute("SES_ID");
			     		Connection con = ConnectionManager.getConnection();   							
						Statement statement = con.createStatement();
						String sql ="select * from customer where custID = '"+session.getAttribute("SES_ID")+ "'";
						ResultSet resultSet = statement.executeQuery(sql);
						while(resultSet.next()){
					%>
                    <form action="updateAccountProcess.jsp" method="post">  
			    		<div class="user-details">
	                                
		                    <input type="hidden" name="custID" value="<%=resultSet.getString("custID") %>">                      
		                        
		                    <div class="input-box">
			                    <span class="details">Username</span>
			                    <input type="text" value="<%=resultSet.getString("custUsername") %>"  name="custUsername" >
		                    </div>
		                                
		                    <div class="input-box">
			                    <span class="details">Phone Number</span>
			                    <input type="text" value="0<%=resultSet.getString("custPhoneNum") %>"  name="custPhoneNum" >
		                    </div>
		                                
		                    <div class="input-box">
			                    <span class="details">Password</span>
			                    <input type="text" value="<%=resultSet.getString("custPwd") %>"  name="custPwd" >
		                    </div>
		                                
		                    <div class="input-box">
			                    <span class="details">Email</span>
			                    <input type="text" value="<%=resultSet.getString("custEmail") %>"  name="custEmail" >
		                    </div>
		                  </div>  
	
		                  <div class="input-box button" style="text-align: center;">
		                        <a href="Homepage.jsp?custID=<%=session.getAttribute("SES_ID") %>" style="text-decoration:none; background-color: #ccc; color:black;">Back to Homepage</a>
		                        <input type="Submit" value="Update Account" onclick="updateAccount()" style="background-color: green">		           
		                        <a href="deleteAccount.jsp?<%=session.getAttribute("SES_ID") %>" onclick="delete()" style="text-decoration:none; background-color: red;">Delete Account</a>
		                  </div>
                    </form>
                </div>    
            </div>
        </div>
        <%
		    }
		    
	    %>          
	</body>
</html>