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
<%
try
{
String s_suname=session.getAttribute("suname").toString();
//out.println(s_suname);
//int c=0;
int p_pin=Integer.parseInt(request.getParameter("pin"));
//out.println(p_pin);
String s_cno=session.getAttribute("scno").toString();
//out.println(s_cno);
int s_pin=Integer.parseInt(session.getAttribute("spin").toString());
//out.println(p_pin);
int s_bal=Integer.parseInt(session.getAttribute("sbal").toString());
//out.println(s_bal);

String s_spname=session.getAttribute("spname").toString();
//out.println(s_spname);
int s_sprice=Integer.parseInt(session.getAttribute("sprice").toString());
//out.println(s_sprice);
int s_scredit=Integer.parseInt(session.getAttribute("scredit").toString());
//out.println(s_scredit);

//out.print(s_suname);
//out.print(p_pin);

//out.print(s_bal);

//out.println(s_spname);
//out.println(s_sprice);
//out.println(s_scredit);

if(p_pin==s_pin)
{
	int c_bal=s_bal-s_sprice;
	
	
		 
		Connection con=DBConnection.getConnection();

		Statement s=con.createStatement();
	    ResultSet rs=s.executeQuery("select * from ac_stat where user_name='"+s_suname+"'");
		if(rs.next())
		{
			//c++;
			//int pano=rs.getInt(2);		
			int cr_bgt=rs.getInt(5);
			int credit=rs.getInt(6);
			
			int t_credit=credit+s_scredit;
			int t_bgt=cr_bgt+s_scredit;
			//int t_pno=pano+c;
						
			PreparedStatement ps=con.prepareStatement("update ac_stat set cr_balance=?,cr_brought=? where user_name='"+s_suname+"'");
			ps.setInt(1,t_credit);
			ps.setInt(2,t_bgt);
			//ps.setInt(3,t_pno);
			ps.executeUpdate();
			ps.close();
		}
		
		PreparedStatement ps_card=con.prepareStatement("update card_master set balance=? where card_no='"+s_cno+"'");
		ps_card.setInt(1,c_bal);
						
		ps_card.executeUpdate();
		ps_card.close();
		
		out.print("<center><h2>Credit points has been added in your account. </h2></center>");

}
else
{
	out.print("<h2><center>Invalid pincode</center></h2>");
}
}catch(Exception e){out.print(e);}
%>

</body>
</html>