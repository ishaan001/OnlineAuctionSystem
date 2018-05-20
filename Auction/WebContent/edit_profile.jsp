<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="config.DBConnection"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="user_home.jsp"></jsp:include> 
<%
String sunm=session.getAttribute("suname").toString();

try
{ 
	Connection con=DBConnection.getConnection();
	
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from profile where mob_no=(select mob_no from user_master where user_name='"+sunm+"')");
	
	while(rs.next())
	{
		String fnm=rs.getString(1);
		String lnm=rs.getString(2);
		int mob_no=rs.getInt(3);
		String email=rs.getString(4);
		String address=rs.getString(5);
		String country=rs.getString(6);
		String state=rs.getString(7);
		String city=rs.getString(8);		
%>	
   <form name="f1" method="post" action="edit_profile_update.jsp">
   <center>
   <fieldset style="width:30%">
     <table width="703" height="177" border="0">
       <tr>
         <td colspan="3"><img src="images\\edit.png" width="444" height="131"></td>
       </tr>
       <tr>
         <td width="152">First Name:</td>
         <td width="222"><input type="text" name="fnm" value='<%=fnm %>'  class="input-1"></td>
         <td width="406">&nbsp;</td>
       </tr>
       <tr>
         <td height="29"> Last Name:</td>
         <td><input type="text" name="lnm" value='<%=lnm %>' class="input-1"></td>
         <td>&nbsp;</td>
       </tr>
       <tr>
         <td>PHONE NO:</td>
         <td><input type="text" name="phn" value='<%=mob_no %>' class="input-1" readonly></td>
         <td>&nbsp;</td>
       </tr>
       <tr>
         <td>Email ID:</td>
         <td><input type="text" name="email" value='<%=email %>' class="input-1"></td>
         <td>&nbsp;</td>
       </tr>
       <tr>
         <td>Address:</td>
         <td><input type="text" name="address" value='<%=address %>' class="input-1"></td>
         <td>&nbsp;</td>
       </tr>
       
       <tr>
         <td>Country:</td>
         <td><input type="text" name="country1" value='<%=country %>' class="input-1" readonly></td>
       </tr>
       <tr>
         <td>State:</td>
         <td><input type="text" name="state1" value='<%=state %>' class="input-1" readonly></td>
       </tr>
       <tr>
         <td>City:</td>
         <td><input type="text" name="city1" value='<%=city %>' class="input-1" readonly></td>
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