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
<body>
<jsp:include page="user_home.jsp"></jsp:include> 
<%
String s_unm=session.getAttribute("suname").toString();

try
{
	 Connection con=DBConnection.getConnection();
	
	Statement s=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
    ResultSet rs=s.executeQuery("select * from sel_amount where user_name='"+s_unm+"' ");
    int size = 0;
    if (rs.last())
    {
     size = rs.getRow();
     rs.beforeFirst(); // not rs.first() because the rs.next() below will move on, missing the first element
    }
    if(size>0)
    {
    %>
    <br><br><center><b>Seller Balance amount Details</b>
    <table width=600 border=1 bgcolor="" cellspacing=0 cellpadding=3><tr align="center" ><th bgcolor="#CC99CC" >User Name</th><th bgcolor=#CC99CC>Balance Amount</th></tr>
    <% 
    while(rs.next())
    {
    	String unm=rs.getString(1);
    	String baln=rs.getString(2);
    	    
    %>
    <tr align="center"><td><%=unm %></td><td><%=baln %></td></tr>
    <%} %>
    </table>
    <%}
	else
	{
	//out.print("No such records present");
		out.print("<center><br><br><br><br><img src='images\\error.jpeg'></center>");
	}}catch(Exception e){out.print(e);} %>

</body>
</html>