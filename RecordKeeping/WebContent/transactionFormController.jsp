<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@page import="com.records.org.TransactionHistory"%>
<%@page import="java.sql.*" %>
<%@page
	import="javax.security.auth.message.callback.PrivateKeyCallback.Request"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="style2.css" type="text/css">
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<div class="txtt">


	<%
		String url="jdbc:mysql://127.0.0.1:3306/transactions";
		String user="root";
		String password="2121";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, user, password);
		PreparedStatement st= con.prepareStatement("insert into transacthistory(sender,receiver,amount) values(?,?,?)");
		
		String receiver=request.getParameter("receiver");
		String senderr=request.getParameter("sender");
		String amountt=request.getParameter("amount"); 
		int ammount = Integer.parseInt(amountt);
		st.setString(1, senderr);
		st.setString(2, receiver);
		st.setInt(3, ammount);
		//String sqll="select id,sender,receiver,amount from transacthistory where sender=sender";
		st.executeUpdate();
		//ResultSet rs = st.executeQuery(sqll);
		//rs.next();
		PreparedStatement prst = con.prepareStatement("select balance from login where username=(?)");
		prst.setString(1, senderr);
		ResultSet rst = prst.executeQuery();
		rst.next();
		int senderBalance = rst.getInt(1) - ammount;
		//-------------------------------------------------------------------------------------
		
		
		PreparedStatement prst1 = con.prepareStatement("select balance from login where username=(?)");
		prst1.setString(1, receiver);
		ResultSet rst1 = prst1.executeQuery();
		rst1.next();
		int receiverBalance = rst1.getInt(1)+ammount;
		//-------------------------------------------------------------------------------------
		
		
		PreparedStatement finalPrepareSender = con.prepareStatement("update login set balance=(?) where username=(?);");
		finalPrepareSender.setInt(1, senderBalance);
		finalPrepareSender.setString(2, senderr);
		finalPrepareSender.executeUpdate();
		//-------------------------------------------------------------------------------------
		
		
		PreparedStatement finalPrepareReceiver = con.prepareStatement("update login set balance=(?) where username=(?);");
		finalPrepareReceiver.setInt(1, receiverBalance);
		finalPrepareReceiver.setString(2, receiver);
		finalPrepareReceiver.executeUpdate();
	%>
	
	Transaction details updated.
	<%=senderr %> Transferred Rps <%=ammount %> to <%=receiver %>
	<br/>
	<a href="mainmenu.html">Go to Main Menu</a>
	

	
	<br/>
</div>
</html>