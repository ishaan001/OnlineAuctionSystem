<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<center><h1>You Have Been Successfully logged out</h1></center>
<img alt="" src="images\rsz_thanking.png">
<%
session.invalidate();
//response.sendRedirect("login.jsp");
%>

<a href="navit.html">Go Back to Front Page</a>


</body>
</html>