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
    ResultSet rs=s.executeQuery("SELECT SNO,SEL_CR_MASTER.B_ID,BID_DATE,BID_PRICE,PR_NAME,SEL_CR_MASTER.USER_NAME,F_WHERE,CR_AMOUNT FROM SEL_CR_MASTER,BID_MASTER,PRODUCT WHERE SEL_CR_MASTER.B_ID=BID_MASTER.BID_ID AND BID_MASTER.PR_ID=PRODUCT.PR_ID AND SEL_CR_MASTER.user_name='"+s_unm+"' ");
    int size = 0;
    if (rs.last())
    {
     size = rs.getRow();
     rs.beforeFirst(); // not rs.first() because the rs.next() below will move on, missing the first element
    }
    if(size>0)
    {
    %>
    <br><br><center><b>Seller Credit amount Details</b>
    <table width=900 border=1 bgcolor="" cellspacing=0 cellpadding=3><tr bgcolor="#CC99CC"><th>Sl.No</th><th>Bid ID</th><th>Bid Date</th><th>Bid Price</th><th>Product Name</th><th>User Name</th><th>From Where</th><th>Credit Amount</th></tr>
    <% 
    while(rs.next())
    {
    	String sno=rs.getString(1);
    	String bid=rs.getString(2);
    	String bdate=rs.getString(3);
    	String bprice=rs.getString(4);
    	String pname=rs.getString(5);
    	String uname=rs.getString(6);
    	String fwhere=rs.getString(7);
    	String camount=rs.getString(8);
    %>
    <tr align="center"><td><%=sno %></td><td><%=bid %></td><td><%=bdate %></td><td><%=bprice %></td><td><%=pname %></td><td><%=uname %></td><td><%=fwhere %></td><td><%=camount %></td></tr>
    <%} %>
    </table>
    <%}
	else
	{
		out.print("<center><br><br><br><br><img src='iamges\\error.jpg'></center>");
	}}catch(Exception e){out.print(e);} %>

</body>
</html>