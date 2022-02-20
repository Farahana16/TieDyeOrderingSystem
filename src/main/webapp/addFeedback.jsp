<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
 <link rel="stylesheet" href="css/styleFeed.css">
</head>
<body><br><br>
<% 
	int custID = Integer.parseInt(request.getParameter("custID")); 
	int orderID = Integer.parseInt(request.getParameter("orderID"));
%>
	<div id="feedback-form">
  <h2 class="header">Thank you for review!</h2>
  <div>
    <form action="addFeedbackControllerr?orderID=<%=orderID%>&custID=<%=custID %>" method="post">
	    <label for="details">Rate: </label>
	        <select name="feedbackrating" required>
	                  <option value="1">1</option>
	                   <option value="2">2</option>
	                    <option value="3">3</option>
	                     <option value="4">4</option>
	                      <option value="5">5</option>
	   </select>
	   <br><br>
	   <label for="details">Comment: </label>
      <textarea name="feedbackcomment" placeholder="Leave your review here"></textarea>
      <button type="submit">Submit</button>
    </form>
  </div>
</div>

</body>
</html>
