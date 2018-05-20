<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="config.DBConnection" %>
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
	pname=document.f1.pname.value;
	pcredit=document.f1.credit.value;
	price=document.f1.price.value;
	img=document.f1.img.value;
	
	if(pname=="")
	{
    alert("Please enter package name");
    document.f1.pname.focus();
    }
    else if(pcredit=="")
	{
       alert("Please enter credits");
       document.f1.pcredit.focus();
    }
    else if(isNaN(pcredit))
	{
       alert("Credits should contain only digit");
       document.f1.pcredit.focus();
    }
    else if(pcredit<=0)
    {
    	alert("Credit not less than or equal to zero");
    	document.f1.pcredit.focus();
    }
    else if(price=="")
	{
       alert("Please enter package price of the item");
       document.f1.price.focus();
    }
    else if(isNaN(price))
	{
	   alert("Pacakge price field should contain only digit");
	   document.f1.price.focus();
	}
	else if(price<=0)
    {
    	alert("Package price not equal or less than zero");
    	document.f1.price.focus();
    }  
    else if(img=="")
    {
    	alert("Image field should not empty");
    	document.f1.img.focus();
    }
	else
		document.f1.submit();
}
</script>
</head>
<body>
<jsp:include page="admin_home.jsp"></jsp:include>
<br>
<br>
<%
String pnm=request.getParameter("pnm");
int p_pnm=Integer.parseInt(pnm);
try
{
	 
	Connection con=DBConnection.getConnection();
	
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from package where pack_id='"+p_pnm+"'");
	
	while(rs.next())
	{
		int p_id=rs.getInt(1);
		String p_name=rs.getString(2);
		String p_price=rs.getString(3);
		String p_credit=rs.getString(4);
%>	
   <form name="f1" method="get" action="Categories">
    <input type="text" class="form-control" value="addUpdatedPackage" name="ftype" hidden>
   <center>
   <fieldset style="width:30%">
     <table width="518" height="177" border="0">
       <tr>
         <td colspan="2"><img src="edit.png" width="444" height="131"></td>
       </tr>
       <tr>
         <td width="295">Package ID:</td>
         <td width="610"><input type="text" name="pid" value='<%=p_id %>'  class="input-1" readonly ></td>
       </tr>
       <tr>
         <td height="29"> Package Name:</td>
         <td><input type="text" name="pname" value='<%=p_name %>' class="input-1"></td>
       </tr>
       <tr>
         <td> Package Price:</td>
         <td><input type="text" name="price" value='<%=p_price %>' class="input-1"></td>
       </tr>
       <tr>
         <td>Package Credit:</td>
         <td><input type="text" name="credit" value='<%=p_credit %>' class="input-1"></td>
       </tr>
       <tr>
         <td>Change Image:</td>
         <td><input type="file" name="img" class="input-1"></td>
       </tr>
       <tr>
         <td>&nbsp;</td>
         <td><input type="button" value="Update" onClick="check()"></td>
       </tr>
     </table>
     </fieldset>
  </center>
     <p>&nbsp;</p>
     <p><br>
     </p>
   </form>
   <%}
	}catch(Exception e){out.print(e);}%>

</body>
</html>