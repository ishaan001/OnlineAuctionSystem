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
<script language="JavaScript">
function check() {
var r = document.getElementsByName("pc")
var c = -1

for(var i=0; i < r.length; i++){
   if(r[i].checked) {
      c = i; 
   }
}
if (c == -1) alert("please select any package");
else
 document.f1.submit();
}

</script>
</head>
<body>

<jsp:include page="user_home.jsp"></jsp:include> 
<br>
<br>
<br>
<form name="f1" method="post" action="pack_pay.jsp">
<%
try
{
	 
	Connection con=DBConnection.getConnection();
	
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from package");
%>
<table align="center">
<%
	while(rs.next())
	{
		int vpid=rs.getInt(1);
		String vpname=rs.getString(2);
		int vprice=rs.getInt(3);
		int vcredit=rs.getInt(4);
		
		//lob b=rs.getBlob(5); 
		//byte barr[]=b.getBytes(1,(int)b.length());
              
		//FileOutputStream fout=new FileOutputStream("D:\\ONLINE_AUCTION\\Online_Auction\\WebContent\\Image\\"+vpid+".jpg");  
		//fout.write(barr);  
		//String n=vpid+".jpg";
		//out.println(vpid);
		//out.println(n); 
		//String n2="d:/ONLINE_AUCTION/Online_Auction/WebContent/Image/"+n;
		//out.print(n2);
%>

<tr><td><img width="200" height="100" src="images\\coupon.jpg"></td>
<td><input id="pc1" type="radio" name="pc" value=<%=vpid %>><%=vpname %></td> 
<td><input type="button" value="Buy Now" onclick="check()"></td></tr>
<%} %>
</table>
<%

	}catch(Exception e){out.print(e);}
%>
</form>

</body>
</html>