<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="config.DBConnection"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="user_home.jsp"></jsp:include> 
<%
String s_unm=session.getAttribute("suname").toString();

try
{
 
	Connection con=DBConnection.getConnection();
	
	Statement s=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
    ResultSet rs=s.executeQuery("select * from SEL_CONF_HISTORY where user_name='"+s_unm+"' ");
    int size = 0;
    if (rs.last())
    {
     size = rs.getRow();
     rs.beforeFirst(); // not rs.first() because the rs.next() below will move on, missing the first element
    }
    if(size>0)
    {
    %>
    <br><br><center><b>Bid Confirmation Details</b>
    <table width=800 border=1 bgcolor="" cellspacing=0 cellpadding=3><tr bgcolor="#CC99CC"><th>Sl.No</th><th>Confirmation ID</th><th>Product owner Name</th><th>Amount</th><th>Status</th><th>Winner Name</th></tr>
    <% 
    while(rs.next())
    {
    	String sno=rs.getString(1);
    	String cid=rs.getString(2);
    	String unm=rs.getString(3);
    	String amount=rs.getString(4);
    	String status=rs.getString(5);
    	String f_where=rs.getString(6);
    	
    
    %>
    <tr align="center"><td><%=sno %></td><td><%=cid %></td><td><%=unm %></td><td><%=amount %></td><td><%=status %></td><td><%=f_where %></td></tr>
    <%} %>
    </table>
    <%}
	else
	{
		out.print("<center><br><br><br><br><img src='images\\error.jpg'></center>");
	}}catch(Exception e){out.print(e);} %>

</body>
</html>