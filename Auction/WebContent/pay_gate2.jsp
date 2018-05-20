<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="config.DBConnection"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
body,td,th {
	font-family: Calibri;
}
</style>
<style type="text/css">
.input-1{
	border:1px solid black;
	border-radius:5px;
	height:20px;
}
</style>
<script language="JavaScript">

function check()
{
	pin=document.f1.pin.value;
				
	if(pin=="")
	{
       alert("Please enter pin No.");
       document.f1.pin.focus();
    }
    else if(pin.length!=4)
	{
       alert("Please enter valid pin No.");
       document.f1.pin.focus();
    }
    else if(isNaN(pin))
	{
	   alert("Pin No should contain only digit");
	   document.f1.pin.focus();
	}	    
	else
		document.f1.submit();
}
</script>
</head>
<body>

<%
String pcno=request.getParameter("cno");
String pchnm=request.getParameter("chnm");
String pctype=request.getParameter("ctype");
String pmonth=request.getParameter("month");
String pyear=request.getParameter("year");
String pcvv=request.getParameter("cvv");

int pcfid=Integer.parseInt(request.getParameter("cfid"));
int ppid=Integer.parseInt(request.getParameter("pid"));
String ppname=request.getParameter("pname");
String pprice=request.getParameter("price");
int pbid=Integer.parseInt(request.getParameter("bid"));
String pdate=request.getParameter("bdate");
String p_punm=request.getParameter("punm");


String expy=pmonth+" "+pyear;

try
{
	 
	Connection con=DBConnection.getConnection();
	
	Statement s=con.createStatement();
    ResultSet rs=s.executeQuery("select * from card_master where card_no='"+pcno+"'");
    if(rs.next())
    {
	   String vcno=rs.getString(1);
	   String vchnm=rs.getString(2);
	   String vctype=rs.getString(3);
	   String vexpiry=rs.getString(4);
	   String vcvv=rs.getString(5);
	   String vpin=rs.getString(6);
	   String vbal=rs.getString(7);
	   
	   if(vcno.equals(pcno))
	   {
		   if(vchnm.equals(pchnm))
		   {
			   if(vctype.equals(pctype))
			   {
				   if(vexpiry.equals(expy))
				   {
					   if(vcvv.equals(pcvv))
					   {
						   session.setAttribute("scno",vcno);
						   session.setAttribute("spin",vpin);
						   session.setAttribute("sbal",vbal);
						   
						   session.setAttribute("scfid",pcfid);
						   session.setAttribute("spid",ppid);
						   session.setAttribute("spname",ppname);
						   session.setAttribute("sprice",pprice);
						   session.setAttribute("sbid",pbid);
						   session.setAttribute("sbdate",pdate);
						   session.setAttribute("s_punm",p_punm);
						   
						   
						   %>
                           <center>
						   <fieldset style="width:70%">
  						   <form name="f1" method="post" action="pay_gate3.jsp">
						     <table width="714" height="113" border="0">
						       <tr>
						         <td colspan="3"><img src="pay.png" width="708" height="215"></td>
					           </tr>
						       <tr>
						         <td>&nbsp;</td>
						         <td height="29">Enter Pin Code: </td>
						         <td><input type="password" name="pin" placeholder="Pin no" class="input-1" required></td>
					           </tr>
						       <tr>
						         <td>&nbsp;</td>
						         <td height="40">&nbsp;</td>
						         <td><input type="button" value="Pay" onClick="check()"></td>
					           </tr>
					         </table>
  						   </form>
                           </fieldset></center>
					   <%
					   }
					   else
					   {
						   out.print("<center><h2>Invalid cvv no</h2></center>");
					   }
				   }
				   else
				   {
					   out.print("<center><h2>Invalid expiry date</h2></center>");
				   }
			   }
			   else
			   {
				   out.print("<center><h2>Invalid card type</h2></center>");
			   }
		   }
		   else
		   {
			   out.print("<center><h2>Invalid card holder name</h2></center>");
		   }
	   }
	   else
	   {
		   out.print("<center><h2>Invalid card number</h2></center>");
	   }
	   
    }
    else
    {
    	out.print("<center><h2>Invalid card number</h2></center>");
    }
}catch(Exception e){out.print(e);}
%>

</body>
</html>