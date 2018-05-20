<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="config.DBConnection" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<script language="JavaScript">

function check()
{
	c_id=document.f1.c_id.value;
			
	if(c_id=="-1")
	{
    alert("Please choose Category ID");
    }
   	else
		document.f1.submit();
}
</script>
</head>
<body>
<jsp:include page="admin_home.jsp"></jsp:include><br><br><br>
<br>
<br>
<%
	
	String s1=request.getSession().getAttribute("result").toString();
	if(s1.equalsIgnoreCase("success"))
	{
	%>
		 
		<center><h2>Category information has been succesfully Edited.</h2></center>
		 
	<% 
		
	}
	

%>
<br>
<br>
<form name="f1" method="post" action="edit_category_search.jsp">
<center>
<fieldset style="width:30%">
  <table width="584" height="45" border="0">
    <tr>
      <td width="167" height="41">Choose Category Name:</td>
      <td width="113"><select name="c_id" class="input-1">
        <option value="-1">----Select----</option>
        <%
try
{
	Connection con = DBConnection.getConnection();

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
      <td width="179"><div align="center">
        <input type="button" value="Search" onClick="check()">
      </div></td>
    </tr>
  </table>
  </fieldset>
  </center>
  <p>&nbsp;</p>
  <p><br>
  </p>	
</form>

</body>
</html>