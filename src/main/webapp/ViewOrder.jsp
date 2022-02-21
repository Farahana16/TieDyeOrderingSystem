<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@page import="java.text.DecimalFormat" %>

<!DOCTYPE html>
<% DecimalFormat format = new DecimalFormat("0.00"); %>
<html lang="en">
<head>
	<title>View Order</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<style>
		/* Style the body */
		body {
		  font-family: Arial;
		  margin: 0;
		}
		
		
		/* Header/Logo Title */
		.header {
		  padding: 40px;
		  text-align: center;
		  background: #728d87;
		  color: white;
		  font-size: 30px;
		}
		
		/* Page Content */
		.content {
		    padding:20px;
		}
		
		.button {
		  border: none;
		  color: white;
		  padding: 15px 32px;
		  text-align: center;
		  text-decoration: none;
		  display: inline-block;
		  font-size: 16px;
		  margin: 4px 2px;
		  cursor: pointer;
		}
		
		.button1 {
		    background-color: #008CBA;
		} /* Blue */
		
		.button2 {
		  background-color: #4CAF50;
		} /* Green */
		
		
		
		/* Column container */
		.row {  
		  display: -ms-flexbox; /* IE10 */
		  display: flex;
		  -ms-flex-wrap: wrap; /* IE10 */
		  flex-wrap: wrap;
		}
		
		/* Create two unequal columns that sits next to each other */
		/* Sidebar/left column */
		.side {
		  -ms-flex: 30%; /* IE10 */
		  flex: 30%;
		  background-color: #f1f1f1;
		  padding: 20px;
		}
		
		.column {
		  float: left;
		  width: 50%;
		  padding: 20px;
		}
		
		/* Clearfix (clear floats) */
		.row::after {
		  content: "";
		  clear: both;
		  display: table;
		}
		
		/* MENU BAR STYLE START HERE */
		.menu-bar {
		    background: black;
		    text-align: center;
		}
		
		.menu-bar ul{
		    display: inline-flex;
		    list-style: none;
		    color: #fff;
		}
		
		.menu-bar ul li {
		    width: 120px;
		    margin: 15px;
		    padding: 15px;
		}
		
		.menu-bar ul li a {
		    text-decoration: none;
		    color: #fff;
		}
		
		.active, .menu-bar ul li:hover {
		    background: #9fc7d1 ;
		    border-radius: 8px ;
		}
		
		/* Menu bar in menu bar */
		.sub-menu-1 {
		    display: none;
		}
		
		.menu-bar ul li:hover .sub-menu-1 {
		    display: block;
		    position: absolute;
		    background: rgb(0, 0, 0);
		    margin-top: 15px;
		    margin-left: -15px;
		}
		
		.menu-bar ul li:hover .sub-menu-1 ul {
		    display: block;
		    margin: 10px;
		}
		
		.menu-bar ul li:hover .sub-menu-1 ul li {
		    width: 150px;
		    padding: 10px;
		    border-bottom: 1px dotted #fff;
		    background: transparent;
		    border-radius: 0;
		    text-align: left;
		}
		
		.menu-bar ul li:hover .sub-menu-1 ul li:last-child {
		    border-bottom: none;
		}
		
		.menu-bar ul li:hover .sub-menu-1 ul li a:hover {
		    color: #51868f;
		}
		
		/*FOOTER*/
		footer{
		    bottom: 0;
		    left: 0;
		    right: 0;
		    background: #111;
		    height: auto;
		    width: 100vw;
		    font-family: "Open Sans";
		    padding-top: 40px;
		    color: #fff;
		}
		.footer-content{
		    display: flex;
		    align-items: center;
		    justify-content: center;
		    flex-direction: column;
		    text-align: center;
		}
		.footer-content h3{
		    font-size: 1.8rem;
		    font-weight: 400;
		    text-transform: capitalize;
		    line-height: 3rem;
		}
		.footer-content p{
		    max-width: 500px;
		    margin: 10px auto;
		    line-height: 28px;
		    font-size: 14px;
		}
		.socials{
		    list-style: none;
		    display: flex;
		    align-items: center;
		    justify-content: center;
		    margin: 1rem 0 3rem 0;
		}
		.socials li{
		    margin: 0 10px;
		}
		.socials a{
		    text-decoration: none;
		    color: #fff;
		}
		.socials a i{
		    font-size: 1.1rem;
		    transition: color .4s ease;
		
		}
		.socials a:hover i{
		    color: aqua;
		}
		
		.footer-bottom{
		    background: #000;
		    width: 100vw;
		    padding: 20px 0;
		    text-align: center;
		}
		.footer-bottom p{
		    font-size: 14px;
		    word-spacing: 2px;
		    text-transform: capitalize;
		}
		.footer-bottom span{
		    text-transform: uppercase;
		    opacity: .4;
		    font-weight: 200;
		}
		
		/*GO TO UP BUTTON*/
		#myBtn {
		  display: none;
		  position: fixed;
		  bottom: 20px;
		  right: 30px;
		  z-index: 99;
		  font-size: 18px;
		  border: none;
		  outline: none;
		  background-color: rgb(0, 0, 0);
		  color: white;
		  cursor: pointer;
		  padding: 15px;
		  border-radius: 4px;
		}
		
		#myBtn:hover {
		  background-color: #555;
		}
		
		input[type=text] {
		  width: 130px;
		  box-sizing: border-box;
		  border: 2px solid #ccc;
		  border-radius: 4px;
		  font-size: 16px;
		  background-color: white;
		  background-image: url('searchicon.png');
		  background-position: 10px 10px; 
		  background-repeat: no-repeat;
		  padding: 12px 20px 12px 40px;
		  -webkit-transition: width 0.4s ease-in-out;
		  transition: width 0.4s ease-in-out;
		  margin-left: 45px;
		}
		
		input[type=text]:focus {
		  width: 100%;
		}
	</style>
</head>
<body>
	<% int custID = Integer.parseInt(request.getParameter("custID")); %>
	<div class ="menu-bar">
    <ul>
        <li><a href="Homepage.jsp?custID=<%=custID%>">Home</a></li>
        <!--  -<li><a href="#">Contact</a></li>
        <li><a href="#">About Us</a>
            <div class="sub-menu-1">
                <ul>
                    <li><a href="#">Vision</a></li>
                    <li><a href="#">Mission</a></li>
                    <li><a href="#">Teams</a></li>
                </ul>
            </div>
        </li>-->
        <li class="active"><a href="#"><i class="fa fa-user"></i></a>
            <div class="sub-menu-1">
                <ul>
                	<li><a href="UpdateAccount.jsp">Update Account</a></li>
                    <li><a href="billingAddress.jsp">Update Billing Address</a></li>
                    <li><a href="shippingAddress.jsp">Update Shipping Address</a></li>
                	<li class="active"><a href="#">View Order</a></li>
                    <li><a href="index.jsp">Log Out</a></li>
                </ul>
            </div>
        </li>
        <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
    </ul>
</div>
  <section class="w3-container"> 
  	<h1 style="text-align:center">Customer Order History</h1>
 	<c:forEach items="${products}" var="c" varStatus="products"> 
    <div class="row">
        <div class="column">
            <img src="${c.image }" alt="" style="width:30%">
        </div>
        <div class="column">
          <h4>Size : <c:out value="${c.productsize}"/></h4>
          <h4>Description : <c:out value="${c.productdesc}"/></h4>
          <h4>Price :RM <c:out value="${c.productprice}"/></h4>
          <button><a id="${c.productid}" href="addFeedback.jsp?custID=<%=custID%>&orderID=${c.orderid}" style="text-decoration:none;'">Add Feedback</a></button>
        </div>
      </div>
      </c:forEach>
    <hr>
  </section>

  <!-- FOOTER -->
        <footer>
          <div class="footer-content">
              <h3>Taka Cast-Off Teams</h3>
              <p>Taka Cast Off Sendirian Berhad</p>
              <ul class="socials">
                  <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                  <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                  <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                  <li><a href="#"><i class="fa fa-youtube"></i></a></li>
                  <li><a href="#"><i class="fa fa-linkedin-square"></i></a></li>
              </ul>
          </div>
          <div class="footer-bottom">
              <p>copyright &copy;2022. designed by <span>TakaCast-Off</span></p>
          </div>
      </footer>

      <script>
         //SCRIPT GO TOP BUTTON
        //Get the button
        var mybutton = document.getElementById("myBtn");

        // When the user scrolls down 20px from the top of the document, show the button
        window.onscroll = function() {scrollFunction()};

        function scrollFunction() {
          if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
            mybutton.style.display = "block";
          } else {
            mybutton.style.display = "none";
          }
        }

        // When the user clicks on the button, scroll to the top of the document
        function topFunction() {
          document.body.scrollTop = 0;
          document.documentElement.scrollTop = 0;
        }
      </script>
</body>
</html>
