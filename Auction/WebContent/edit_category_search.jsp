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

<style type="text/css">
.input-1{
	border:1px solid black;
	border-radius:5px;
	height:20px;
}
</style>
</head>
<body>
<jsp:include page="admin_home.jsp"></jsp:include><br><br>
<%

String pc_id=request.getParameter("c_id");
try
{
	Connection con = DBConnection.getConnection();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from category where c_id='"+pc_id+"'");
	while(rs.next())
	{
		String c_id=rs.getString(1);
		String c_name=rs.getString(2);
		String c_des=rs.getString(3);
%>	
   <form name="f1" method="get" action="Categories">
   <input type="text" class="form-control" value="editCategory" name="ftype" hidden>
   <center>
   <fieldset style="width:30%">
     <table width="494" height="243" border="0">
       <tr>
          <td colspan="3"><img src="images\\edit.png" width="444" height="131"></td>
       </tr>
       <tr>
         <td>&nbsp;</td>
         <td><p>Category ID:</p></td>
         <td><input type="text" name="cid" value='<%=c_id %>' class="input-1" readonly ></td>
       </tr>
       <tr>
         <td>&nbsp;</td>
         <td height="24"> Category Name:</td>
         <td><input type="text" name="cname" value='<%=c_name %>' class="input-1" required></td>
       </tr>
       <tr>
         <td>&nbsp;</td>
         <td>Description:</td>
         <td><input type="text" name="cdes" value='<%=c_des %>' class="input-1" required></td>
       </tr>
       <tr>
         <td>&nbsp;</td>
         <td>&nbsp;</td>
         <td><input type="submit" value="Update"></td>
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