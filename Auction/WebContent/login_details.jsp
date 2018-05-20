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
<jsp:include page="admin_home.jsp"/>
<br>
<br>

<%
try
{
	Connection con = DBConnection.getConnection();
	
	Statement s=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
    ResultSet rs=s.executeQuery("select * from user_master");
    int size = 0;
    if (rs.last())
    {
     size = rs.getRow();
     rs.beforeFirst(); // not rs.first() because the rs.next() below will move on, missing the first element
    }
    if(size>0)
    {
    %>
    <br><br><center><b>Login Details</b>
    <table width=800 border=1 cellspacing=0 cellpadding=3><tr bgcolor="#CC99CC"><th>Mobile No</th><th>User Name</th><th>User type</th></tr>
    <% 
    while(rs.next())
    {
    	String mob=rs.getString(1);
    	String unm=rs.getString(2);
    	String pwd=rs.getString(3);
    	String utype=rs.getString(4);
    	    
    %>
    <tr align=center><td><%=mob %></td><td><%=unm %></td><td><%=utype %></td></tr>
    <%} %>
    </table>
    <%
    }
    else
    {
    	out.print("<center><br><br><br><br><img src='images\\error.jpeg'></center>");
    }
}catch(Exception e){out.print(e);} %>

</body>
</html>