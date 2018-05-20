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
    ResultSet rs=s.executeQuery("SELECT CONF_ID,CONFIRM_BID.BID_ID,BID_DATE,BID_MASTER.PR_ID,PR_NAME,BID_PRICE,PRODUCT.USER_NAME,CONFIRM_BID.STATUS,CONFIRM_BID.USER_NAME FROM BID_MASTER,CONFIRM_BID,PRODUCT WHERE BID_MASTER.BID_ID=CONFIRM_BID.BID_ID AND PRODUCT.PR_ID=BID_MASTER.PR_ID AND CONFIRM_BID.USER_NAME='"+s_unm+"'");
    int size = 0;
    if (rs.last())
    {
     size = rs.getRow();
     rs.beforeFirst(); // not rs.first() because the rs.next() below will move on, missing the first element
    }
    if(size>0)
    {
    %>
    <br><br><center><b>Buyer Bid Confirmation Details</b>
    <table width=800 border=1 bgcolor="" cellspacing=0 cellpadding=3><tr bgcolor="#CC99CC"><th>Conf.ID</th><th>Bid ID</th><th>Bid Date</th><th>Product ID</th><th>Product Name</th><th>Final bid price</th><th>Owner Name</th><th>Status</th><th>Winner</th></tr>
    <% 
    while(rs.next())
    {
    	String cid=rs.getString(1);
    	String bid=rs.getString(2);
    	String bdate=rs.getString(3);
    	String pid=rs.getString(4);
    	String pname=rs.getString(5);
    	String bprice=rs.getString(6);
    	String pown=rs.getString(7);
    	String status=rs.getString(8);
    	String win=rs.getString(9);    
    %>
    <tr align="center"><td><%=cid %></td><td><%=bid %></td><td><%=bdate %></td><td><%=pid %></td><td><%=pname %></td><td><%=bprice %></td><td><%=pown %></td><td><%=status %></td><td><%=win %></td></tr>
    <%} %>
    </table><center><br><a href="confirm_id.jsp"><img src="images\\buy.jpg"></a></br></center>
    <%}
	else
	{
		out.print("<center><br><br><br><br><img src='images\\error.jpg'></center>");
	}}catch(Exception e){out.print(e);} %>
	<br><br>
	


</body>
</html>