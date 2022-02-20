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
	    	function updateBilling(){
	    		alert("Address Updated Successfully!")
	    	}
	    	
	    	function addBilling(){
	    		alert("Address Added Successfully!")
	    	}
	    </script>  
	</head>
	<body>
        <div class="container">
          <div class="title" style="text-align:center;">Billing Address</div>
		    <div class="row">
			    <div class="column">
			     	 <%
						//String ID = session.getAttribute("SES_ID");
						Connection con = ConnectionManager.getConnection();   							
						Statement statement = con.createStatement();
						String sql ="select * from customer c join billingaddress b on c.custID = b.custID where c.custID = '"+session.getAttribute("SES_ID")+ "'";
						ResultSet resultSet = statement.executeQuery(sql);
						if(resultSet.next()){
					%>
                    <form action="updateAddressProcess.jsp" method="post">  
			    		<div class="user-details">
	                                
		                    <input type="hidden" name="billingID" value="<%=resultSet.getString("billingID") %>">      
		                    <input type="hidden" name="shippingID" value="0">                 
		                        
		                    <div class="input-box">
			                    <span class="details">Billing Address</span>
			                    <input type="text" value="<%=resultSet.getString("custbillingAddress") %>"  name="address" >
		                    </div>
		                                
		                    <div class="input-box">
			                    <span class="details">Biling City</span>
			                    <input type="text" value="<%=resultSet.getString("custbillingCity") %>"  name="city" >
		                    </div>
		                                
		                    <div class="input-box">
			                    <span class="details">Billing State</span>
			                    <input type="text" value="<%=resultSet.getString("custbillingState") %>"  name="state" >
		                    </div>
		                                
		                    <div class="input-box">
			                    <span class="details">Billing Poscode</span>
			                    <input type="text" value="<%=resultSet.getString("custbillingPoscode") %>"  name="poscode" >
		                    </div>
		                  </div>  
	
		                  <div class="input-box button" style="text-align: center;">
		                        <a href="Homepage.jsp?custID=<%=session.getAttribute("SES_ID") %>" style="text-decoration:none; background-color: #ccc; color:black;">Back to Homepage</a>
		                        <input type="Submit" value="Update Billing Address" onclick="update()" style="background-color: green">		           		                      
		                  </div>
                    </form>
                    <%}else{ %>
                    	No Billing Address yet. Add Now!
                    	<form action="addAddressProcess.jsp" method="post">  
			    		<div class="user-details">
			    			                               
		                    <input type="hidden" name="billing" value="B">
				    <input type="hidden" name="custid" value="<%=session.getAttribute("SES_ID") %>"> 

		                    <div class="input-box">
			                    <span class="details">Billing Address</span>
			                    <input type="text" name="address" >
		                    </div>
		                                
		                    <div class="input-box">
			                    <span class="details">Billing City</span>
			                    <input type="text" name="city" >
		                    </div>
		                                
		                    <div class="input-box">
			                    <span class="details">Billing State</span>
			                    <input type="text" name="state" >
		                    </div>
		                                
		                    <div class="input-box">
			                    <span class="details">Billing Poscode</span>
			                    <input type="text" name="poscode" >
		                    </div>
		                  </div>  
	
		                  <div class="input-box button" style="text-align: center;">
		                   <a href="Homepage.jsp?custID=<%=session.getAttribute("SES_ID") %>" style="text-decoration:none; background-color: #ccc; color:black;">Back to Homepage</a>		                    
		                        <input type="Submit" value="Add Billing Address" onclick="addBilling()" style="background-color: green">		           	                     
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
