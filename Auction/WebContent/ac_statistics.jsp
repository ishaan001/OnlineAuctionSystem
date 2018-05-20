<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="config.DBConnection" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<style type="text/css">
body,td,th {
	font-family: Calibri;
}
</style>
</head>
<body>
<jsp:include page="user_home.jsp"></jsp:include>
<br>
<br>
 

<table border="1" align="center" width="400" cellspacing=0 cellpadding=0>
<br><br>
<caption>Account Statistics</caption>
<%
String s_suname=session.getAttribute("suname").toString();
try
{
	 
	Connection con=DBConnection.getConnection();
	
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from ac_stat where user_name='"+s_suname+"'");
	while(rs.next())
	{
		String vunm=rs.getString(1);
		String vapno=rs.getString(2);
		String vawon=rs.getString(3);
		String vcused=rs.getString(4);
		String vcbgt=rs.getString(5);
		String vcbal=rs.getString(6);
%>

<tr align=center><th align=left>User Name:</th><td bgcolor="#CC99CC"><%=vunm %></td></tr>
<tr align=center><th align=left>Auction participate No:</th><td bgcolor="#CC99CC"><%=vapno %></td></tr>
<tr align=center><th align=left>Auction Won:</th><td bgcolor="#CC99CC"><%=vawon %></td></tr>
<tr align=center><th align=left>Credit Used:</th><td bgcolor="#CC99CC"><%=vcused %></td></tr>
<tr align=center><th align=left>Credit Brought:</th><td bgcolor="#CC99CC"><%=vcbgt %></td></tr>
<tr align=center><th align=left>Credit Balance:</th><td bgcolor="#CC99CC"><%=vcbal %></td></tr>

<%}}catch(Exception e){out.print(e);}
	%>
</table>
</body>

</body>
</html>