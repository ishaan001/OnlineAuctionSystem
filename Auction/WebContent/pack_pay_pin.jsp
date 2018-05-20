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

<br><br><br>
<%
String pcno=request.getParameter("cno");
String pchnm=request.getParameter("chnm");
String pctype=request.getParameter("ctype");
String pmonth=request.getParameter("month");
String pyear=request.getParameter("year");
int pcvv=Integer.parseInt(request.getParameter("cvv"));

int ppid=Integer.parseInt(request.getParameter("pid"));
String ppname=request.getParameter("pname");
int pprice=Integer.parseInt(request.getParameter("price"));
int pcredit=Integer.parseInt(request.getParameter("credit"));

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
	   int vcvv=rs.getInt(5);
	   int vpin=rs.getInt(6);
	   int vbal=rs.getInt(7);
	   
	   if(vcno.equals(pcno))
	   {
		   if(vchnm.equals(pchnm))
		   {
			   if(vctype.equals(pctype))
			   {
				   if(vexpiry.equals(expy))
				   {
					   if(vcvv==pcvv)
					   {
						   session.setAttribute("scno",vcno);
						   session.setAttribute("spin",vpin);
						   session.setAttribute("sbal",vbal);
						   
						   session.setAttribute("spid",ppid);
						   session.setAttribute("spname",ppname);
						   session.setAttribute("sprice",pprice);
						   session.setAttribute("scredit",pcredit);
						   
						   %>
						   <form name="f1" method="post" action="pay.jsp">
                           <center>
						   <fieldset style="width:70%">
						      <table width="714" height="113" border="0">
						       <tr>
						         <td colspan="4"><img src="images\\pay.png" width="708" height="215"></td>
					           </tr>
						       <tr>
						         <td width="11">&nbsp;</td>
						         <td width="131">Enter Pin Code: </td>
						         <td width="186"><input type="password" name="pin" placeholder="Pin code" class="input-1" required></td>
						         <td width="368"><input type="button" value="Pay" onClick="check()"></td>
					           </tr>
					         </table>
						     			   </form>
					   <%
					   }
					   else
					   {
						   out.print("<h2><center>Invalid cvv no</center></h2>");
					   }
				   }
				   else
				   {
					   out.print("<h2><center>Invalid expiry date</center></h2>");
				   }
			   }
			   else
			   {
				   out.print("<h2><center>Invalid card type</center></h2>");
			   }
		   }
		   else
		   {
			   out.print("<h2><center>Invalid card holder name</center></h2>");
		   }
	   }
	   else
	   {
		   out.print("<h2><center>Invalid card number-2</center></h2>");
	   }
	   
    }
    else
    {
    	out.print("<h2><center>Invalid card number-1</center></h2>");
    }
}catch(Exception e){out.print(e);}
%>

</body>
</html>