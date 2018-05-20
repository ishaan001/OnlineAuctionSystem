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

<script language="JavaScript">

function check()
{
	pid=document.f1.pid.value;
			
	if(pid=="-1")
	{
    alert("Please choose product id");
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
		 
		<center><h2>product has been closed to the bidding.</h2></center>
		 
	<% 
		
	}
	

%>
<br>
<br>
<form name="f1" method="get" action="Auction">
<input type="text" class="form-control" value="closebid" name="ftype" hidden>
<center>
<fieldset style="width:30%">
  <table width="491" height="37" border="0">
    <tr>
      <td height="31">Select Product ID: </td>
      <td><select name="pid">
        <option value="-1">----Select----</option>
 <%
try
{
	 
	Connection con=DBConnection.getConnection();

	Statement s=con.createStatement();
	ResultSet rs=s.executeQuery("select * from product where curdate()+1>end_date+1 and status='Open' and win_name is null");
	while(rs.next())
	{
		int pid=rs.getInt(1);
	%>
        <option value=<%=pid %>><%=pid %></option>
        <%}
	}catch(Exception e){out.print(e);}%>
      </select></td>
      <td><input type="button" value="Search" onClick="check()"></td>
    </tr>
  </table>
   </fieldset>
  </center>
  <p>&nbsp;</p>
  <p><br><br>
  </p>
</form>

</body>
</html>