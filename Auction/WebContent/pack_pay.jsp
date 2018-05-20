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
	cno=document.f1.cno.value;
	chnm=document.f1.chnm.value;
	ctype=document.f1.ctype.value;
	month=document.f1.month.value;
	year=document.f1.year.value;
	cvv=document.f1.cvv.value;
			
	if(cno=="")
	{
    	alert("Please enter card number");
    	document.f1.cno.focus();
    }
    else if(isNaN(cno))
	{
	   alert("Card no. field should contain only digit");
	   document.f1.cno.focus();
	}    
    else if(chnm=="")
	{
    	alert("Please enter Card Holder Name");
    	document.f1.chnm.focus();
    }
    else if(!isNaN(chnm))
	{
	   alert("Card Holder Name field should contain only character");
	   document.f1.chnm.focus();
	}
	else if(ctype=="-1")
	{
       alert("Please select card type");
    }
    else if(month=="-1")
	{
	   alert("Please select month");
	  
	}
	else if(year=="-1")
    {
    	alert("Please select year");
    }
    else if(cvv=="")
	{
       alert("Please enter CVV No.");
       document.f1.cvv.focus();
    }
    else if(cvv.length!=3)
	{
       alert("Please enter valid CVV No.");
       document.f1.cvv.focus();
    }
    else if(isNaN(cvv))
	{
	   alert("CVV No should contain only digit");
	   document.f1.cvv.focus();
	}	    
	else
		document.f1.submit();
}
</script>
</head>
<body>
<br><br><br><br>
<%
Integer op=Integer.parseInt(request.getParameter("pc"));
//out.print(op);
//String s_uname=session.getAttribute("suname").toString();

try
{
	 
	Connection con=DBConnection.getConnection();
	
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from package where pack_id='"+op+"'");
	while(rs.next())
	{
		int vpid=rs.getInt(1);
		String vpname=rs.getString(2);
		int vprice=rs.getInt(3);
		int vcredit=rs.getInt(4);
		
		//out.println(vpid);
		//out.println(vpname);
		//out.println(vprice);
		//out.println(vcredit);
%>
<form name="f1" method="post" action="pack_pay_pin.jsp">
<center>
<fieldset style="width:80%">
  <table width=714>
  <tr><td colspan="4"><img src="images\\pay.png" width="708" height="215"></td></tr>
  <input type="hidden" name="pid" value='<%=vpid %>'>
  <input type="hidden" name="pname" value='<%=vpname %>' >
  <input type="hidden" name="price" value='<%=vprice %>'>
  <input type="hidden" name="credit" value='<%=vcredit %>'>
  
  <tr>
    <td>&nbsp;</td>
    <td>Card No:</td><td><input type="text" name="cno" placeholder="Card No" class="input-1" required></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td>Card Holder Name:</td><td><input type="text" name="chnm" placeholder="Card Holder Name" class="input-1" required></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td>Card Type:</td><td>
    <select name="ctype"  class="input-1">
      <option value="-1">----Select----</option>
      <option value="Master">Master</option>
      <option value="Credit">Credit</option>
      <option value="Debit">Debit</option>
    </select></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td>Expiry Date:</td><td>
    <select name="month" class="input-1">
      <option value="-1">----Select----</option>
      <option value="January">January</option>
      <option value="February">February</option>
      <option value="March">March</option>
      <option value="April">April</option>
      <option value="May">May</option>
      <option value="June">June</option>
      <option value="July">July</option>
      <option value="August">August</option>
      <option value="September">September</option>
      <option value="October">October</option>
      <option value="November">November</option>
      <option value="December">December</option>
    </select>
    &nbsp;&nbsp;
    <select name="year" class="input-1">
      <option value="-1">----Select----</option>
      <option value="2017">2017</option>
      <option value="2018">2018</option>
      <option value="2019">2019</option>
      <option value="2020">2020</option>
      <option value="2021">2021</option>
    </select></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td>CVV No:</td><td><input type="text" name="cvv" placeholder="CVV No" class="input-1" required></td></tr>
    <tr>
      <td>      
      <td>&nbsp;<td><input type="button" value="Go" onClick="check()"></td></tr>
    <%
	}
}catch(Exception e){out.print(e);}
%>
 </table>
 </fieldset></center>
</form>

</body>
</html>