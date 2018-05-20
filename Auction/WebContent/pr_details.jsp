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
</head>
<body>
<jsp:include page="user_home.jsp"></jsp:include> 
<br>
<br>
<br>
<form name="f1" method="post" action="pr_bid.jsp">
<%
String s_unm=session.getAttribute("suname").toString();
try
{
	 
	Connection con=DBConnection.getConnection();
	
	Statement st=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
	ResultSet rs=st.executeQuery("select * from product where status='Open' and win_name is null and user_name!='"+s_unm+"' and curdate()+1 between start_date and (end_date+1)");
	int size = 0;
	if (rs.last())
	{
	     size = rs.getRow();
	     rs.beforeFirst(); // not rs.first() because the rs.next() below will move on, missing the first element
	}
	if(size>0)
	{
		%>
		<table align=center border="0"><caption><img width=780 height=120 src="images\\auc.jpg"></caption>
				<%
	while(rs.next())
	{
		int vpid=rs.getInt(1);
		//out.print(vpid);
		String vpname=rs.getString(2);
		//Blob b=rs.getBlob(12); 
		//byte barr[]=b.getBytes(1,(int)b.length());
              
		//FileOutputStream fout=new FileOutputStream("E:\\Hackathon's\\3rdyr_project\\Auction\\WebContent\\images\\"+vpid+"Prdct.jpg");  
		//fout.write(barr);  
		//out.println(vpid);
		//String n=vpid+".jpg";
		//out.println(vpid);
		//out.print(n);
		
%>
<tr><td><%=vpname %></td><td align=center><img width="200" height="120" src="images\\<%=vpid%>Prdct.jpg"></td><td><a href="pr_choose.jsp?v1=<%=vpid %>"><img src="images\\details.jpg"></a></td></tr>

<%
	}
		%>
		</table>
		<%
	}
	else
	{
		//out.print("Sorry no such record present for bidding.... ");
		out.print("<center><br><br><br><br><img src='images\\error.jpg'></center>");
	}
	
}catch(Exception e){out.print(e);}
%>

</body>
</html>