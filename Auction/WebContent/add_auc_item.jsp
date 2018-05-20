<%@page import="config.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="config.DBConnection"%>
<%@page import="java.sql.*" %>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
body,td,th {
	font-family: Calibri;
	color: #000;
}
.f1 {
	color: #F00;
}
.f1 {
	color: #F00;
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
	iname=document.f1.iname.value;
	des=document.f1.des.value;
	ctg=document.f1.ctg.value;
	bprice=document.f1.bprice.value;
	credit=document.f1.credit.value;
	
	var r = document.getElementsByName("sts")
	var c = -1
 
    for(var i=0; i < r.length; i++)
	{
   		if(r[i].checked)
   		{
      		c = i; 
    	}
	}
	
	
	
	pimg=document.f1.pimg.value;
	 
	if(iname=="")
	{
    	alert("Please enter Item name");
    	document.f1.iname.focus();
    }
    else if(des=="")
	{
    	alert("Please enter description of the item");
    	document.f1.des.focus();
    }
    else if(ctg=="-1")
    {
       alert('Please choose category');
    }
   
	else if(bprice=="")
	{
       alert("Please enter base price of the item");
       document.f1.bprice.focus();
    }
    else if(isNaN(bprice))
	{
	   alert("Base price field should contain only digit");
	   document.f1.bprice.focus();
	}
	else if(bprice<=0)
    {
    	alert("Base price not equal or less than zero");
    	document.f1.bprice.focus();
    }
    else if(credit=="")
	{
       alert("Please enter credits");
       document.f1.credit.focus();
    }
    else if(isNaN(credit))
	{
       alert("Credits should contain only digit");
       document.f1.credit.focus();
    }
    else if(credit<0)
    {
    	alert("Credit not less than zero");
    	document.f1.credit.focus();
    }  
   
	else if (c == -1)
	   alert("please select any status");  
    else if(pimg=="")
    {
    	alert("Image field should not empty");
    	document.f1.pimg.focus();
    }    
	else
		document.f1.submit();
}
</script>
</head>
<body>

<%
String utype=session.getAttribute("val").toString();
if(utype.equalsIgnoreCase("admin"))
{
%>
<jsp:include page="admin_home.jsp"></jsp:include> 
<%
}
else
{
%>
<jsp:include page="user_home.jsp"></jsp:include> 
<%
}
%>
<br>
<br>
<%
	
	String s1=request.getSession().getAttribute("result").toString();
	if(s1.equalsIgnoreCase("success"))
	{
	%>
		 
		<center><h2>product has been successfully added to the auction.</h2></center>
		 
	<% 
		
	}
	

%>
<form name="f1" method="get" action="Auction">
  <input type="text" class="form-control" value="addAuc" name="ftype" hidden>
<center>
<fieldset style="width:50%">
  <table width="519" border="0" align="center">
    <tr>
      <td colspan="3"><img src="images\\addCart.png" width="233" height="116"></td>
    </tr>
    <tr>
      <td width="17">&nbsp;</td>
      <td width="216">Item Name: </td>
      <td width="272"><input type="text" name="iname" class="input-1"></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>Description:</td>
      <td><input type="text" name="des" class="input-1"></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>Category:</td>
      <td><select name="ctg" class="input-1">
        <option value="-1">----Select----</option>
        <%
try
{
	Connection con=DBConnection.getConnection();

	Statement s=con.createStatement();
	ResultSet rs=s.executeQuery("select * from category");
	while(rs.next())
	{
		int c_id=rs.getInt(1);
		String c_name=rs.getString(2);
%>
        <option value=<%=c_id %>><%=c_name %></option>
        <%}
	}catch(Exception e){out.print(e);}%>
      </select></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td> Starting Bid price:</td>
      <td><input type="number" name="bprice" class="input-1"></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>Credit:</td>
      <td><input type="number" name="credit" class="input-1"></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td> Start Date for Biding:</td>
      <td><input type="date" name="sdate" class="input-1" required></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td> End Date for Biding:</td>
      <td><input type="date" name="edate" class="input-1" required></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>Status:
        <input type="radio" name="sts" value="Open">
      Open</td>
      <td><input type="radio" name="sts" value="Close">
        &nbsp;
      Close</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>Item Image:</td>
      <td><input type="file" name="pimg" class="input-1"></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td class="f1"><strong>[Choose only .jpg file]</strong></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td><input type="button" value="Add Item" onClick="check()"></td>
    </tr>
  </table>
  </fieldset>
  </center>
  <p><br>
    <br>
    <br>
    <br>
  </p>
</form>

</body>
</html>