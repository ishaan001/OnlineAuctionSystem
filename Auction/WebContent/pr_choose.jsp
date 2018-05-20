<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="config.DBConnection"%>
<%@page import="java.sql.*" %>
<%@page import="java.io.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
.input-1{
	border:0px solid black;
	}
	.input-2{
	border:1px solid black;
	border-radius:5px;
	height:20px;
}
</style>

<script language="JavaScript">
function my()
{

 var a=parseInt(document.f1.bid.value);
 var d=document.f1.bid.value;
 var b=parseInt(document.f1.bprice.value);
 var c=parseInt(document.f1.mbid.value);

 if(d=="")
 {
   alert('Please enter amount');
 }
 else if(a<=b)
 {
   alert('Please correct your amount:enter amount that is greater than base price');
 }
 else if(a<=c)
 {
   alert('Please correct your amount:');
 }
 else
   		document.f1.submit();
}
</script>
</head>
<body>

<jsp:include page="user_home.jsp"></jsp:include> 
<center>
<fieldset style="width:25%">
<div>
<form name="f1" method="post" action="pr_bid.jsp">
<%
String pid=request.getParameter("v1");
String s_unm=session.getAttribute("suname").toString();
try
{
 
	Connection con=DBConnection.getConnection();
	
	
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from product where pr_id='"+pid+"'");
	if(rs.next())
	{
		int vpid=rs.getInt(1);
		String vpname=rs.getString(2);
		int vpcid=rs.getInt(3);
		String vdes=rs.getString(4);
		String vbprice=rs.getString(5);
		String vcredit=rs.getString(6);
		String vsts=rs.getString(7);
		String vsdate=rs.getString(8);
		String vedate=rs.getString(9);
		String vuname=rs.getString(10);
%>
<table width=488 border=0 celspacing=0 cellpadding=0>
  <tr>
    <th colspan="3"><img src="images\\bid.png" width="333" height="139"></th>
    </tr>
  <tr>
    <th width="54">&nbsp;</th>
    <th width="242"><div align="left">Product Name:</div></th><td width="440"><input type=text value='<%=vpname %>' class="input-1" readonly></td></tr>
<tr>
  <th>&nbsp;</th>
  <th><div align="left">Description:</div></th><td><input type=text value=<%=vdes %> class="input-1" readonly></td></tr>
<tr>
  <th>&nbsp;</th>
  <th><div align="left">Minimum bid price:</div></th><td><input type=text name="bprice" value='<%=vbprice %>' class="input-1" readonly></td></tr>
<tr>
  <th>&nbsp;</th>
  <th><div align="left">Credit:</div></th><td><input type=text value=<%=vcredit %> class="input-1" readonly></td></tr>
<tr>
  <th>&nbsp;</th>
  <th><div align="left">Status:</div></th><td><input type=text value=<%=vsts %> class="input-1" readonly></td></tr>
<tr>
  <th>&nbsp;</th>
  <th><div align="left">Start Date:</div></th><td><input type=text value=<%=vsdate %> class="input-1" readonly></td></tr>
<tr>
  <th>&nbsp;</th>
  <th><div align="left">End Date:</div></th><td><input type=text value=<%=vedate %> class="input-1" readonly></td></tr>
<input type="hidden" name="pc" value=<%=vpid %>>		
		<%		
		Statement st_bd=con.createStatement();
		ResultSet rs_bd=st_bd.executeQuery("SELECT UNAME,BID_PRICE,PR_ID FROM BID_MASTER WHERE PR_ID='"+vpid+"' and BID_PRICE=(SELECT MAX(BID_PRICE) FROM BID_MASTER WHERE PR_ID='"+vpid+"')");
		if(rs_bd.next())
		{
			String vunm=rs_bd.getString(1);
			int price=rs_bd.getInt(2);
			int prid=rs_bd.getInt(3);
		%>	
			<tr>
			  <th>&nbsp;</th>
		    <th><div align="left">Highest Bid Price:</div></th><td><font color=red size=4><b><%=price %></b></font></td></tr>
			<tr>
			  <th>&nbsp;</th>
		    <th><div align="left">User name:</div></th><td><font color=red size=4><b><%=vunm %></b></font></td></tr>	
						
		<%	if(vunm.equals(s_unm) &&  prid==vpid)
			{
				out.print("<tr><td>&nbsp;</td></tr><tr height=10 bgcolor=#CC99CC><td align=center colspan=7><font color=maroon size=4>Highest bidder</font><td></tr>");		  
			}		
			else
			{
		%>
				<tr>
				  <th>&nbsp;</th>
			    <th><div align="left">Amount for Bid:</div></th><td><input type="text" name="bid"  class="input-2"></td></tr>
				<input type="hidden" name="cr" value=<%=vcredit %>>
				<input type="hidden" name="mbid" value='<%=price %>'>	
				<tr>
				  <td>&nbsp;</td>
			    <td>&nbsp;</td><td><input type="button" value="Bid" onClick="my()"></td></tr>
	    <%
	        }
		}
		else
		{
	    %>
				<tr>
				  <th>&nbsp;</th>
			    <th><div align="left">Highest Bid Price:</div></th><td><font color=red>No such bid occured</font></td></tr>
				<tr>
				  <th>&nbsp;</th>
			    <th><div align="left">User name:</div></th><td><font color=red>No such bid occured</font></td></tr>	
				<tr>
				  <th>&nbsp;</th>
			    <th><div align="left">Amount for Bid:</div></th><td><input type="text" name="bid" class="input-2" ></td></tr>
				<input type="hidden" name="cr" value=<%=vcredit %>>	
				<input type="hidden" name="mbid" value='0'>	
				
				<tr>
				  <td>&nbsp;</td>
			    <td>&nbsp;</td><td><input type="button" value="Bid" onClick="my()"></td></tr>
		
		<%
			}		
		%>
</table></form>
</div></fieldset>
<div>
<%
			
	}
	Statement st_bm=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
	ResultSet rs_bm=st_bm.executeQuery("SELECT * FROM BID_MASTER WHERE PR_ID='"+pid+"' order by bid_price desc");
	int size = 0;
    if (rs_bm.last())
    {
     size = rs_bm.getRow();
     rs_bm.beforeFirst(); // not rs.first() because the rs.next() below will move on, missing the first element
    }
    if(size>0)
    {
%>
<br><br>
<table width=520 border=1 cellspacing=0 cellpadding=0><tr bgcolor="#CC99CC"><th>Bid ID</th><th>Product ID</th><th>User Name</th><th>Price</th></tr>
<caption>Bid Log</caption>
<%	
	while(rs_bm.next())
	{
		int bid=rs_bm.getInt(1);
		int pidd=rs_bm.getInt(2);
		String unm=rs_bm.getString(3);
		String price=rs_bm.getString(5);
%>
<tr align=center><td><%=bid %></td><td><%=pidd %></td><td><%=unm %></td><td><%=price %></td></tr>		
<%
	}
    }
}catch(Exception e){out.print(e);}
%>
</table></div></center>

</body>
</html>