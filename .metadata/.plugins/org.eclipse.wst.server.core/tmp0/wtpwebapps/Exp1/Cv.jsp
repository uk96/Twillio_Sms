<%@page import="com.mysql.jdbc.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		Connection con;
		PreparedStatement pst;
		String user,pass,email,number;
		int rs;
	%>	
	<%
	try{
		Class.forName("com.mysql.jdbc.Driver");
		con=(Connection)DriverManager.getConnection("jdbc:mysql://localhost/1514033","root","");
		user=request.getParameter("username");
		pass=request.getParameter("password");
		email=request.getParameter("email");
		number=request.getParameter("number");
		pst=(PreparedStatement)con.prepareStatement("insert into Student values(?,?,?,?)");
		pst.setString(1,user);
		pst.setString(2,pass);
		pst.setString(3,email);
		pst.setString(4,number);
		rs=pst.executeUpdate();
		if(rs==1)
		{
			out.println("Sucessfully added.");
		}
		else
		{
			out.println("Row update failed");
		}
		
	}catch(Exception e){
		out.println(e);
	}
	%>
	<form action="Display.jsp" method="get">
	<label>Click to display all details of all users.<br></label>
	<input type="submit" value="Submit">
	</form>	
</body>
</html>

