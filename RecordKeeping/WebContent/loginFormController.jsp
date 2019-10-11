<%@page import="java.sql.*"  %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
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
String username=request.getParameter("username");
String passsword=request.getParameter("password");

PreparedStatement st = con.prepareStatement("select username,password from login where username=(?)");

st.setString(1, username);


ResultSet rs = st.executeQuery();
rs.next();
String passcheck = rs.getString(2);
if(passcheck.equals(passsword)){ %>
	Successfully Logged in..
	<br/>
	<a href="transactionForm.html">Continue to Transaction..</a>
<% 
}else{
	
	out.print("password incorrect..");
}
%>



</body>
</html>