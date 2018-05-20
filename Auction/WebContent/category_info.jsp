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
<body><jsp:include page="admin_home.jsp"></jsp:include>
<br>
<br>
<br>
<%
try
{
	Connection con = DBConnection.getConnection();
	
	Statement s=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
    ResultSet rs=s.executeQuery("select * from category");
    int size = 0;
    if (rs.last())
    {
     size = rs.getRow();
     rs.beforeFirst(); // not rs.first() because the rs.next() below will move on, missing the first element
    }
    if(size>0)
    {
    %>
    <br><br><center><b>Category Details</b>
    <table width=600 border=1  cellspacing=0 cellpadding=0><tr bgcolor="#CC99CC"><th>Category ID</th><th>Category Name</th><th>Description</th></tr>
    <% 
    while(rs.next())
    {
    	String c_id=rs.getString(1);
    	String c_name=rs.getString(2);
    	String c_des=rs.getString(3);
    
    %>
    <tr align="center"><td><%=c_id %></td><td><%=c_name %></td><td><%=c_des %></td></tr>
    <%} %>
    </table>
    <%}
    }catch(Exception e){out.print(e);} %>

</body>
</html>