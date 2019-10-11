<%@page import="java.sql.*"  %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="style2.css" type="text/css">
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
String url="jdbc:mysql://127.0.0.1:3306/transactions";
String user="root";
String password="2121";

Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection(url, user, password);
PreparedStatement st= con.prepareStatement("insert into login(username,password) values(?,?)");
String username=request.getParameter("username");
String passsword=request.getParameter("password");
st.setString(1, username);
st.setString(2, passsword);
st.executeUpdate();

%>
Account Created!
<a href="login.html">Go to login page</a>
</body>
</html>