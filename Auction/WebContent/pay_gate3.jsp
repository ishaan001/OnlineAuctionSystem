<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="config.DBConnection"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<jsp:include page="user_home.jsp"></jsp:include><br>
<%
try
{
String s_suname=session.getAttribute("suname").toString();
//out.println(s_suname);
String sunm=session.getAttribute("s_punm").toString();
//out.println(s_suname);
int c=0;
int p_pin=Integer.parseInt(request.getParameter("pin"));
//out.println(p_pin);
String s_cno=session.getAttribute("scno").toString();
//out.println(s_cno);
int s_pin=Integer.parseInt(session.getAttribute("spin").toString());
//out.println(p_pin);
int s_bal=Integer.parseInt(session.getAttribute("sbal").toString());
//out.println(s_bal);


//bidd item
int s_scfid=Integer.parseInt(request.getAttribute("scfid").toString());
//out.println(s_scfid);

//String s_spid=session.getAttribute("spid").toString();
//out.println(s_spid);

//String s_spname=session.getAttribute("spname").toString();
//out.println(s_spname);

int s_sprice=Integer.parseInt(session.getAttribute("sprice").toString());
//out.println(s_sprice);

//String s_sbid=session.getAttribute("sbid").toString();
//out.println(s_sbid);

//String s_sbdate=session.getAttribute("sbdate").toString();
//out.println(s_sbdate);

if(p_pin==s_pin)
{
	int c_bal=s_bal-s_sprice;
	
		Connection con=DBConnection.getConnection();

		Statement s=con.createStatement();
	    ResultSet rs=s.executeQuery("select * from SEL_AMOUNT where user_name='"+sunm+"'");
		if(rs.next())
		{
			int pamount=rs.getInt(2);
			int t_amount=pamount+s_sprice;
									
			PreparedStatement ps=con.prepareStatement("update sel_amount set amount=? where user_name='"+sunm+"'");
			ps.setInt(1,t_amount);
			ps.executeUpdate();
			
			String sts="Winner-Pay";
			PreparedStatement ps1=con.prepareStatement("update CONFIRM_BID set status=? where conf_id='"+s_scfid+"'");
			ps1.setString(1,sts);
			
			ps1.executeUpdate();
			ps1.close();
			
			String sts1="SALE";
			PreparedStatement ps2=con.prepareStatement("update SEL_CONF_HISTORY set status=? where conf_id='"+s_scfid+"'");
			ps2.setString(1,sts1);
			
			ps2.executeUpdate();
			ps2.close();
			
			ps.close();
		}	
		
		PreparedStatement ps_card=con.prepareStatement("update card_master set balance=? where card_no='"+s_cno+"'");
		ps_card.setInt(1,c_bal);
						
		ps_card.executeUpdate();
		ps_card.close();
		
		out.print("<center><h2>Your prduct will be deliverd very soon<br>You delivery address:</h2></center>");
		
		Statement st=con.createStatement();
	    ResultSet rs_add=st.executeQuery("select * from profile where mob_no=(select mob_no from user_master where user_name='"+s_suname+"')");
%>
	   <center><fieldset style="width:50%">
	   <legend>Delivery Address</legend>
	   <table border=0 cellspacing=0 cellpadding=0>
	    
<%
		if(rs_add.next())
		{
		String fnm=rs_add.getString(1);
		String lnm=rs_add.getString(2);
		String mobno=rs_add.getString(3);
		String add=rs_add.getString(5);
		String country=rs_add.getString(6);
		String state=rs_add.getString(7);
		String city=rs_add.getString(8);
		
		String name="Mr./Mrs."+fnm+" "+lnm;
		String address=add+","+city+","+state+","+country;
%>
	<tr><td>Name:</td><td><%=name %></td></tr>
	<tr><td>Address:</td><td><%=address %></td></tr>	
	<tr><td>Mobile No:</td><td><%=mobno %></td></tr>		
<%
		}
%>
		</table></fieldset></center>
<%
}
else
{
	out.print("<h2><canter>Invalid pincode</center></h2>");
}
}catch(Exception e){out.print(e);}
%>

</body>
</html>