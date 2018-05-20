<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="config.DBConnection" %>
<%@page import="java.sql.*" %>
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
	pnm=document.f1.pnm.value;
			
	if(pnm=="-1")
	{
    alert("Please choose package name");
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
	
	String s1=request.getSession().getAttribute("result").toString();
	if(s1.equalsIgnoreCase("success"))
	{
	%>
		 
		<center><h2> information has been successfully Edited of the pack.</h2></center>
		 
	<% 
		
	}
	

%>

<form name="f1" method="post" action="edit_pack_code.jsp">
<center>
<fieldset style="width:30%">
  <table width="586" height="38" border="0">
    <tr>
      <td height="32">Choose package Name :</td>
      <td><select name="pnm" class="input-1">
        <option value="-1">----Select----</option>
        <%
try
{
	Connection con = DBConnection.getConnection();
	Statement s=con.createStatement();
	ResultSet rs=s.executeQuery("select * from package");
	while(rs.next())
	{
		int pc_id=rs.getInt(1);
		String pc_name=rs.getString(2);
%>
        <option value=<%=pc_id %>><%=pc_name %></option>
        <%
	}
	}catch(Exception e){out.print(e);}
%>
      </select></td>
      <td><input type="button" value="Search" onClick="check()"></td>
    </tr>
  </table>
   </fieldset>
  </center>
  <p>&nbsp;</p>
  <p>&nbsp;&nbsp;</p>
</form>
</body>
</html>