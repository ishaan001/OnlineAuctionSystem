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
String s_suname=session.getAttribute("suname").toString();
try
{
	 
	Connection con=DBConnection.getConnection();
	
	Statement s=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
    ResultSet rs=s.executeQuery("select uname,bid_id,bid_date,bid_master.pr_id,pr_name,bid_price from bid_master,product where bid_master.pr_id=product.pr_id and uname='"+s_suname+"'");
    int size = 0;
    if (rs.last())
    {
     size = rs.getRow();
     rs.beforeFirst(); // not rs.first() because the rs.next() below will move on, missing the first element
    }
    if(size>0)
    {
    %>
    <br><br><center><b>Bid Details</b>
    <table width=800 border=1 cellspacing=0 cellpadding=0><tr bgcolor="#CC99CC"><th>User Name</th><th>Bid ID</th><th>Bid Date</th><th>ProductID</th><th>Product Name</th><th>Bid Price</th></tr>
    <%  
    while(rs.next())
    {
    	String vunm=rs.getString(1);
    	String bid=rs.getString(2);
    	String bdate=rs.getString(3);
    	String pid=rs.getString(4);
    	String pname=rs.getString(5);
    	String price=rs.getString(6);
    	    
    %>
    <tr align=center><td><%=vunm %></td><td><%=bid %></td><td><%=bdate %></td><td><%=pid %></td><td><%=pname %></td><td><%=price %></td></tr>
    <%} %>
    </table>
    <%}
    else
    {
    	out.print("<center><br><br><br><br><img src='images\\error.jpg'></center>");
    }
}catch(Exception e){out.print(e);} %>

</body>
</html>