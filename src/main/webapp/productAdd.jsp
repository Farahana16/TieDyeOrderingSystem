<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Add Product</title>
	<!-- Mobile Specific Metas -->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<!-- Font-->
	<link rel="stylesheet" type="text/css" href="css/montserrat-font.css">
	<link rel="stylesheet" type="text/css" href="fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">
	<!-- Main Style Css -->
    <link rel="stylesheet" href="css/styleUpdate.css"/>
</head>
<body class="form-v10">
	<div class="page-content">
		<div class="form-v10-content">
			<form class="form-detail" action="addProduct.jsp" method="post" id="myform">
				<div class="form-right">
					<h2>Add New Product</h2>

					<div class="form-row">
						<input type="text" name="productname" class="productname" id="productname" placeholder="Name" required>
					</div>

					<div class="form-row">
						<input type="text" name="productsize" class="productsize" id="productsize" placeholder="Size" required>
					</div>

					<div class="form-row">
						<input type="text" name="productprice" class="productprice" id="productprice" placeholder="Price" required>
					</div>

					<div class="form-row">
						<input type="text" name="productdesc" class="productdesc" id="productdesc" placeholder="Description" required>
					</div>
					
					<div class="form-row">
						<input type="text" name="productimages" class="productimages" id="productimages" placeholder="Image directory only" required>
					</div>

					<div class="form-row-last" >
						<input type="submit" name="register" class="register" value="Add Product">
					</div>

				</div>
			</form>
		</div>
	</div>
</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>