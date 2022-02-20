<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.DecimalFormat" %>
<%@page import="db.ConnectionManager" %>

<!DOCTYPE html>

<%
	int productID = 0;
	String productImages = null;
	String productName = null;
	double productPrice = 0.00;
	String productSize = null;
	String productDesc = null;
	int custID = Integer.parseInt(request.getParameter("custID"));
 
	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;
	String image = null;
	DecimalFormat format = new DecimalFormat("0.00");
%>

<html>
<head>
	<title>Homepage</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="css/homepage.css">
</head> 

<body>
  <!-- GO TO TOP BUTTON -->
  <button onclick="topFunction()" id="myBtn" title="Go to top"><i class="fa fa-level-up"></i></button>

    <!-- SLIDE SHOW BACKGROUND AND MENU BAR -->
    <div class="slideshow-container">
        <div class ="menu-bar">
            <ul>
                <li class="active"><a href="#">Home</a></li>
                <!--  <li><a href="#">Contact</a></li>
                <li><a href="#">About Us</a>
                    <div class="sub-menu-1">
                        <ul>
                            <li><a href="#">Vision</a></li>
                            <li><a href="#">Mission</a></li>
                            <li><a href="#">Teams</a></li>
                        </ul>
                    </div>
                </li>-->
                <li><a href="#"><i class="fa fa-user"></i></a>
                    <div class="sub-menu-1">
                        <ul>
                            <li><a href="UpdateAccount.jsp">Update Account</a></li>
                            <li><a href="billingAddress.jsp">Update Billing Address</a></li>
                            <li><a href="shippingAddress.jsp">Update Shipping Address</a></li>
                            <li><a href="ViewOrderController?custID=<%=custID%>">View Order</a></li>
                            <li><a href="index.jsp">Log Out</a></li>
                        </ul>
                    </div>
                </li>
                <li><a href="Cart2.jsp?custID=<%=custID%>"><i class="fa fa-shopping-cart"></i></a></li>
            </ul>
        </div>

        <!-- SLIDE SHOW BACKGROUND -->
        <div class="mySlides fade">
          <div class="numbertext">1 / 3</div>
          <img src="images/head1.jpg" style="width:100%; height:50%;">
        </div>
        
        <div class="mySlides fade">
          <div class="numbertext">2 / 3</div>
          <img src="images/head2.jpg" style="width:100%; height:50%;">
        </div>

        <div class="mySlides fade">
          <div class="numbertext">3 / 3</div>
          <img src="images/head3.png" style="width:100%; height:50%;">
        </div>
        
        <br>

        <div style="text-align:center">
            <span class="dot"></span> 
            <span class="dot"></span> 
            <span class="dot"></span> 
        </div>
    </div><br><br>
 
    <!--SEARCH BAR-->
    <form>
      </form><br><br><br> <div class="row">
		<%
		        try{
		        	Connection con = ConnectionManager.getConnection();      		
					statement=con.createStatement();
		        	String sql ="select * from product";
		        	resultSet = statement.executeQuery(sql);
		       		while(resultSet.next()){ 
		       			productID = resultSet.getInt("productId");
		       			productImages = resultSet.getString("productImages");
		       			productName = resultSet.getString("productName");
		       			productPrice = resultSet.getDouble("productPrice");
		       			productSize = resultSet.getString("productSize");
		       			productDesc = resultSet.getString("productDesc");
		       		
		%>
    <!-- PRODUCT IMAGE -->
    
        <div class="card">
            <img src="<%=productImages %>" alt="<%=productName %>" style="width:100%; height:65%;" class="image">
            <h5><%=productName %></h5>
            <p class="price">RM <%=format.format(productPrice) %></p>
            <p style="font-size:15px;">Size: <%=productSize %></p>
            <p style="font-size:15px;"><%=productDesc %></p><br>
            <button id="<%=productID %>"  onclick="addToCart(this.id)">Add to Cart</button>
        </div><br>
 
    <%
		       		}
		       			con.close(); 
		       		}catch (Exception e){
		       			e.printStackTrace();
		       		}
	
    %>
  	  </div><br><br>
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
        //SCRIPT FOR SLIDE SHOW BACKGROUND
        var slideIndex = 0;
        showSlides();
        
        function showSlides() {
          var i;
          var slides = document.getElementsByClassName("mySlides");
          var dots = document.getElementsByClassName("dot");
          for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";  
          }
          slideIndex++;
          if (slideIndex > slides.length) {slideIndex = 1}    
          for (i = 0; i < dots.length; i++) {
            dots[i].className = dots[i].className.replace(" active", "");
          }
          slides[slideIndex-1].style.display = "block";  
          dots[slideIndex-1].className += " active";
          setTimeout(showSlides, 9000); // Change image every 9 seconds
        }

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
        
        //add product to cart
        function addToCart(id){ 
       		console.log(id)
       		location.href = "addToCart.jsp?productID=" + id + "&custID=" + <%=custID%>;
			alert("Item add to cart!");
       	}
    </script>
</body>
</html>
