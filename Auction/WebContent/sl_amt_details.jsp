<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="config.DBConnection" %>
<%@ page import="java.sql.*,javax.naming.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="admin_home.jsp"></jsp:include>
<br>
<br>
<%
String unm=request.getParameter("unm");
try
{
 
	Connection con=DBConnection.getConnection();
	
	Statement s=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
    ResultSet rs=s.executeQuery("select * from SEL_AMOUNT where user_name='"+unm+"'");
    int size = 0;
    if (rs.last())
    {
     size = rs.getRow();
     rs.beforeFirst(); // not rs.first() because the rs.next() below will move on, missing the first element
    }
    if(size>0)
    {
    %>
    <br><br><center><b>Seller Amount Details</b>
    <table width=500 border=1 cellspacing=0 cellpadding=3><tr bgcolor="#CC99CC"><th>User Name</th><th>Balance Amount</th></tr>
    <% 
    while(rs.next())
    {
    	String sunm=rs.getString(1);
    	int amount=rs.getInt(2);
    	    
    %>
    <tr align=center><td><%=sunm %></td><td><%=amount %></td></tr>
    <%} %>
    </table>
    <%}}catch(Exception e){out.print(e);} %>

</body>
</html>