Display.jsp
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.jdbc.Statement"%>
<%@page import="com.mysql.jdbc.Connection"%>
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
		Statement st;
		String user,pass,email,number;
		int rs;
	%>	
	<%
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con=(Connection)DriverManager.getConnection("jdbc:mysql://localhost/1514033","root","");
			st=(Statement)con.createStatement();
			ResultSet rst=st.executeQuery("select * from Student");
			out.print("<table border='10'>");
			out.print("<tr><th>Username</th><th>Email Id</th><th>Password</th></tr>");
			while(rst.next()){
				out.print("<tr><td>"+rst.getString(1)+"</td><td>"+rst.getString(3)+"</td><td>"+rst.getString(4)+"</td></tr>");
			}
		}catch(Exception e){
			out.println(e);
		}
		
	%>
</body>
</html>
