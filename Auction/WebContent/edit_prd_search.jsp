
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

<script language="JavaScript">

function check()
{
	pnm=document.f1.pnm.value;
			
	if(pnm=="-1")
	{
    alert("Please choose product name ");
    }
   	else
		document.f1.submit();
}
</script>
</head>
<body>

<jsp:include page="user_home.jsp"></jsp:include> <br><br>
<%
String sunm=session.getAttribute("suname").toString();
%>

<form name="f1" method="post" action="edit_product.jsp">
<center>
<fieldset style="width:30%">
  <table width="491" height="37" border="0">
    <tr>
      <td height="31">Select Product ID: </td>
      <td><select name="pnm">
        <option value="-1">----Select----</option>
        <%
try
{
	 
	Connection con=DBConnection.getConnection();

	Statement s=con.createStatement();
	ResultSet rs=s.executeQuery("select * from product where start_date>curdate()+1 and pr_id not in(select pr_id from bid_master) and user_name='"+sunm+"' " );
	while(rs.next())
	{
		int pid=rs.getInt(1);
		String pnm=rs.getString(2);
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