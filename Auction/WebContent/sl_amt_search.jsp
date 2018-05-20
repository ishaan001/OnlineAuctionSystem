<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="config.DBConnection" %>
<%@ page import="java.sql.*,javax.naming.*" %>
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
	unm=document.f1.unm.value;
			
	if(unm=="-1")
	{
    alert("Please choose user name ");
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
<form name="f1" method="post" action="sl_amt_details.jsp">
<center>
<fieldset style="width:30%">
  <table width="491" height="37" border="0">
    <tr>
      <td height="31">Select User Name: </td>
      <td><select name="unm">
        <option value="-1">----Select----</option>
        <%
try
{
	 
	Connection con=DBConnection.getConnection();

	Statement s=con.createStatement();
	ResultSet rs=s.executeQuery("select * from user_master where user_name in(select user_name from sel_amount)");
	while(rs.next())
	{
		String uname=rs.getString(2);
	%>
        <option value=<%=uname %>><%=uname %></option>
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