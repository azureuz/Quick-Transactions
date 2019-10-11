<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Balance updating</title>
</head>
<body>
<%
String usern=request.getParameter("username");
String amountt=request.getParameter("amount"); 
int ammount = Integer.parseInt(amountt);

String url="jdbc:mysql://127.0.0.1:3306/transactions";
String user="root";
String password="2121";

Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection(url, user, password);

PreparedStatement prst = con.prepareStatement("select balance from login where username=(?)");
prst.setString(1, usern);
ResultSet rst = prst.executeQuery();
rst.next();
int updatedBalance = rst.getInt(1) + ammount;

PreparedStatement finalPrepareSender = con.prepareStatement("update login set balance=(?) where username=(?);");
finalPrepareSender.setInt(1, updatedBalance);
finalPrepareSender.setString(2, usern);
finalPrepareSender.executeUpdate();
%>

Balance has been successfully updated..
<br/>
<a href="mainmenu.html">Go back to main menu..</a>

</body>
</html>