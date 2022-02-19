<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.DecimalFormat" %>
<!DOCTYPE html>
<%
	String driver = "oracle.jdbc.driver.OracleDriver";
	String connectionUrl = "jdbc:oracle:thin:@localhost:1521:XE ";
	String userid = "taka2";
	String password = "system";
	
	try {
		Class.forName(driver);
	}catch (ClassNotFoundException e) {
		e.printStackTrace();
	}
	
	Connection con  = null;
	Statement statement = null;
	ResultSet resultSet, rs = null;
	String productImage = null;
	int productID = 0;
	String productName = null;
	double productPrice = 0.00;
	String productSize = null;
	String productDesc = null;
	double totalPrice = 0.00;
	String billingAddress = null;
	String billingPoscode = null;
	String billingCity = null;
	String billingState = null;
	String shippingAddress = null;
	String shippingPoscode = null;
	String shippingCity = null;
	String shippingState = null;
	int custID = Integer.parseInt(request.getParameter("custID"));
	
	DecimalFormat format = new DecimalFormat("0.00");
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/CartStyles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Cart</title>
</head>
<body>	
	<div style="background-color:black; color:white;">
    	<h1>Shopping Cart</h1><span style="position:absolute; left:20px; top:4px; "><a href="Homepage.jsp?custID=<%=custID %>" style="text-decoration:none; font-size:15px;">&#8592; Back to Homepage</a></span>
    </div>
    <div>
        <div class="containerA">
            <table>
                <%
                    try{
                    	con = DriverManager.getConnection(connectionUrl, userid, password);
                        statement = con.createStatement();
                        String sql ="SELECT c.*, p.* from customer c join cartitems ca on ca.custID = c.custID join product p on ca.productID = p.productID where c.custID = '"+custID+"'";
                        resultSet = statement.executeQuery(sql);
                   		while(resultSet.next()){
                   			productImage = resultSet.getString("productImages");
                   			productID = resultSet.getInt("productID");
                   			productName = resultSet.getString("productName");
                   			productPrice = resultSet.getDouble("productPrice");
                   			productSize = resultSet.getString("productSize");
                   			productDesc = resultSet.getString("productDesc");
                   			totalPrice = totalPrice + productPrice;
                   			/*billingAddress = resultSet.getString("custbillingAddress");
                   			billingPoscode = resultSet.getString("custbillingPoscode");
                   			billingCity = resultSet.getString("custbillingCity");
                   			billingState = resultSet.getString("custbillingState");
                   			shippingAddress = resultSet.getString("custshippingAddress");
                   			shippingPoscode = resultSet.getString("custshippingPoscode");
                   			shippingCity = resultSet.getString("custshippingCity");
                   			shippingState = resultSet.getString("custshippingState");*/
                   			
                   			
                   			
                %>
                <tr>
                    <td colspan="4"><img src="<%=productImage%>" alt="tiedye"></td>
                    <td>
                        <a href="DeleteFromCart.jsp?productID=<%=productID %>&custID=<%=custID %>" style="text-decoration: none;"><i style="font-size:24px;" class="fa">&#xf014;</i> </a>
                        <%=productName %><br> 
                        RM <%=format.format(productPrice)%><br><br>
                        Size: <%=productSize %> <br>
                        Description: <%=productDesc %> <br>
                        Quantity: 1
                    </td>
                </tr> 
                 <%
    	           }
			 			con.close();
			        }catch (Exception e) {
			        	e.printStackTrace();
			        }
		       	 %>
            </table>
        </div> 
        <div class="containerB - payment">
            <div class="payment">
                <h2 style="text-align: center;">Total Payment</h2>
                <hr>
                <table>
                    <tr>
                        <td>Order Value</td>
                        <td style="left: 300px; position: absolute;">RM <%=format.format(totalPrice) %> </td>
                    </tr>
                    <tr>
                        <td>Delivery</td>
                        <td style="left: 300px; position: absolute;">RM 10.00</td>
                    </tr>
                    
                </table>
                <hr>
                <table>
                    <tr style="font-weight: bold;">
                        <td>Total</td>
                        <td style="left: 300px; position: absolute;">RM <%=format.format(totalPrice+10) %></td>
                    </tr>
                    
               
                </table><br><hr>
            	

                <button><a href="CheckOut.jsp?totalPrice=<%=totalPrice+10%>&custID=<%=custID %>" style="text-decoration: none; color:white;">Proceed to Checkout</a></button><br><br>
            </div>
        </div>
    </div>
</body>
</html>