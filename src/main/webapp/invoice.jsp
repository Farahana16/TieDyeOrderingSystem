<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@page import="java.text.DecimalFormat" %>
<%@page import="db.ConnectionManager" %>


<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="ISO-8859-1">
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />

	<title>Invoice</title>
	<link rel="stylesheet" href="css/invoice.css">
</head>
<body>
	<%
		Connection conn = null;
		Statement stmt = null;
		ResultSet resultSet = null;


		double productPrice = 0.00;
		double orderTotalPrice = 0.00;	
		int oid = Integer.parseInt(request.getParameter("orderID"));
		int cui = Integer.parseInt(request.getParameter("custID")); 
		
		
		DecimalFormat f = new DecimalFormat("0.00");
		
		try{
			conn = ConnectionManager.getConnection();
			stmt = conn.createStatement();
			String sql = "select * from customer c join billingAddress b on c.custID = b.custID join shippingAddress s on c.custID = s.custID join orderr o on c.custID = o.custID join orderDetails od on o.orderID = od.orderID join product p on p.productID = od.productID join payment pay on pay.orderID = o.orderID where o.orderID =" + oid;
			resultSet = stmt.executeQuery(sql);
			while(resultSet.next()){
				productPrice = resultSet.getDouble("productPrice");
				orderTotalPrice = resultSet.getDouble("orderTotalPrice");
		%>
		<div class="invoice-box">
			<table>
			<b>Tie Dye Receipt</b>
				<tr class="top">
					<td colspan="2">
						<table>
							<tr>
								<td>
									<b>Date:</b> <%=resultSet.getDate("ordeDate")%>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr class="information">
					<td colspan="2">
						<table>
							<tr>
								<td>
									<b>Billing Address:</b> <br>
										<%=resultSet.getString("custbillingAddress")%>, <%=resultSet.getString("custbillingPoscode")%>, <br><%=resultSet.getString("custbillingCity")%>, <%=resultSet.getString("custbillingState")%>
									<br> <b>Shipping Address:</b> <br>
										<%=resultSet.getString("custshippingAddress")%>, <%=resultSet.getString("custshippingPoscode")%>, <br><%=resultSet.getString("custshippingCity")%>, <%=resultSet.getString("custshippingState")%>
								</td>

								<td>
									<b>Customer Name: </b><%=resultSet.getString("custName")%><br />
									<b>Customer Email: </b><%=resultSet.getString("custEmail")%><br>
									<b>Customer Phone No: </b><%=resultSet.getString("custPhoneNum")%>
								</td>
							</tr>
						</table>
					</td>
				</tr>

				<tr class="heading">
					<td>Payment Method</td>
				</tr>
				
				<tr class="details">
					<td><%=resultSet.getString("paymentMethod")%></td>
				</tr>
				<tr class="heading">
					<td>Item</td>
					<td>Price</td>
				</tr>
				
				<tr class="details">
					<td><%=resultSet.getString("productName")%> - <%=resultSet.getString("productSize")%> </td>
					<td>RM <%=f.format(productPrice)%></td>	
				</tr>
				<%while(resultSet.next()){ %>
					<tr class="details">
					 	<td><%=resultSet.getString("productName")%> - <%=resultSet.getString("productSize")%></td>
					 	<td>RM <%=f.format(productPrice)%></td>
					</tr>
				<%} %>
				<tr class="details">
				 	<td>Delivery Charge</td>
				 	<td>RM 10.00</td>
				</tr>
				<tr class="details">
				 	<td>Total Price</td>
				 	<td>RM <%=f.format(orderTotalPrice) %></td>
				</tr>		
				<%
					}
					conn.close();
					} catch (Exception e) {
					e.printStackTrace();
					}
				%> 
			</table>
			<button><a href="Homepage.jsp?custID=<%=session.getAttribute("SES_ID") %>" style="text-decoration: none; color:black;">Back to Homepage</a></button>
			<button onclick="window.print()">Print</button>
		</div>
	</body>
</html>
