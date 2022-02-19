<%-- 
    Document   : delete
    Created on : Dec 11, 2021, 11:10:17 AM
    Author     : User
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
 <!DOCTYPE html>
 <html>
     <body>
   
<%
       
            Connection con;
            /*PreparedStatement pst;*/
            ResultSet rs;
            
            Class.forName("org.postgresql.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:postgresql://ec2-54-72-155-238.eu-west-1.compute.amazonaws.com:5432/d3lt7uttu2s0h3", "yyehssgxzsdqki","9e580d650d0f1be9f361083b5a0741807d83c7d92a887482a0630f19cd2dc9c3");
            Statement pst = con.createStatement();
            pst.executeUpdate("delete from customers where custID = '"+session.getAttribute("SES_ID")+"'");
            response.sendRedirect("index.jsp"); 
        
        %>
        
        <script>
            
            alert("Succesful Deleted!");
            window.location.href="index.jsp";
            
       </script>
     </body>
 </html>
