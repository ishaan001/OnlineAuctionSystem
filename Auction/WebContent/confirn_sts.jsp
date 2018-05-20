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
<form name="f1" method="post" action="pay_gate1.jsp">

<%
String con_id=request.getParameter("cfid");
String s_uname=session.getAttribute("suname").toString();

try
{
 
	Connection con=DBConnection.getConnection();
	 
	Statement s=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
    ResultSet rs=s.executeQuery("SELECT  CONF_ID,CONFIRM_BID.BID_ID,BID_DATE,BID_PRICE,PRODUCT.PR_ID,PR_NAME,PRODUCT.USER_NAME,UNAME,CONFIRM_BID.STATUS FROM CONFIRM_BID,BID_MASTER,PRODUCT WHERE BID_MASTER.PR_ID=PRODUCT.PR_ID AND BID_MASTER.BID_ID=CONFIRM_BID.BID_ID AND CONF_ID='"+con_id+"'");
    int size = 0;
    if (rs.last())
    {
     size = rs.getRow();
     rs.beforeFirst(); // not rs.first() because the rs.next() below will move on, missing the first element
    }
    if(size>0)
    {
%>
<table border=1 align="center" ><tr bgcolor="#CC99CC"><th>Confirmation ID</th><th>Bid ID</th><th>Bid Date</th><th>Bid Price</th><th>Product ID</th><th>Product Name</th><th>Product Owner Name</th><th>Winner Name</th><th>Status</th><th>Action</th></tr>    	
<%    while(rs.next())
	  {
    	int cfid=rs.getInt(1);
    	String bid=rs.getString(2);
    	String pid=rs.getString(5);
    	String pname=rs.getString(6);
    	String bdate=rs.getString(3);
    	String bprice=rs.getString(4);
    	String punm=rs.getString(7);
    	String win=rs.getString(8);
    	String sts=rs.getString(9);
 %>
 <tr align=center><td><input type=text name=cfid value=<%=cfid %>></td>
 <td><input type=text name=bid value=<%=bid %> readonly></td>
 <td><input type=text name=bdate value=<%=bdate %> readonly></td>
 <td><input type=text name=bprice value=<%=bprice %> readonly></td>
 <td><input type=text name=pid value=<%=pid %> readonly></td>
 <td><input type=text name=pname value='<%=pname %>' readonly></td>
 <td><input type=text name=punm value=<%=punm %> readonly></td>
 <td><input type=text name=win value=<%=win %> readonly></td>
 <td><input type=text name=sts value=<%=sts %> readonly></td>
 <td><input type=submit value=Book Now></td>
 </tr>
 <%
    }
    %>
    </table>
<%    
    }
    else
    {
    	out.print("<center><br><br><br><br><img src='images\\error.jpg'></center>");
    }
    }catch(Exception e){out.print(e);}
 %>

 </form>

</body>
</html>