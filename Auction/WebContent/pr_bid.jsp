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
<%

int pid=Integer.parseInt(request.getParameter("pc"));
int pbid=Integer.parseInt(request.getParameter("bid"));
int pcr=Integer.parseInt(request.getParameter("cr"));
int vb_id=0;
String s_unm=session.getAttribute("suname").toString();

try
{
	 
	Connection con=DBConnection.getConnection();
	
	Statement st=con.createStatement();
    ResultSet rs_cr=st.executeQuery("select * from ac_stat  where user_name='"+s_unm+"'");
    if(rs_cr.next())
    {
       int v_auc_no=rs_cr.getInt(2);	
       int v_cused=rs_cr.getInt(4);	
       int v_cr=rs_cr.getInt(6);
       if(pcr<=v_cr)
       {
       
		PreparedStatement ps=con.prepareStatement("insert into bid_master(pr_id,UNAME,bid_date,bid_price) values(?,?,curdate()+1,?)");
		//ps.setInt(1,b_id);
		ps.setInt(1,pid);
		ps.setString(2,s_unm);
		ps.setInt(3,pbid);
		int c=ps.executeUpdate();
		
		Statement s=con.createStatement();
	    ResultSet rs=s.executeQuery("select * from bid_master where uname='"+s_unm+"'");
	    while(rs.next())
	    	{
	       		vb_id=rs.getInt(1);
	    	}
	    	int b_id=vb_id;

		int tot_credit=v_cr-pcr;
		int tot_cused=v_cused+pcr;
		int tot_pno=c+v_auc_no;
		
		PreparedStatement ps_cr=con.prepareStatement("update ac_stat set cr_balance=?,cr_used=?,auc_par_no=? where user_name='"+s_unm+"' ");
		ps_cr.setInt(1,tot_credit);
		ps_cr.setInt(2,tot_cused);
		ps_cr.setInt(3,tot_pno);
		
		ps_cr.executeUpdate();
		
		
		
		
		//seller amount update
		
		Statement stp=con.createStatement();
    	ResultSet rs_p=stp.executeQuery("select * from PRODUCT  where pr_id='"+pid+"'");
    	if(rs_p.next())
    	{
		    String unm=rs_p.getString(10);
		    int amount=pcr*10;//credit * 10 go to seller account
			int sno=0;
			Statement s1=con.createStatement();
	       	ResultSet rs1=s1.executeQuery("select * from SEL_CR_MASTER");
	    	while(rs1.next())
	    	{
	       		sno=rs1.getInt(1);
	    	}
	    	int s_no=sno;
	    	
			PreparedStatement ps_c=con.prepareStatement("insert into SEL_CR_MASTER(b_id,user_name,cr_amount,f_where) values(?,?,?,?)");
			ps_c.setInt(1,b_id);
			ps_c.setString(2,unm);
			ps_c.setInt(3,amount);
			ps_c.setString(4,s_unm);
			ps_c.executeUpdate();
		
			Statement st1=con.createStatement();
	    	ResultSet rs_cr1=st1.executeQuery("select * from sel_amount  where user_name='"+unm+"'");
	    	if(rs_cr1.next())
	    	{
	    		int amt=rs_cr1.getInt(2);
	    		int tot_amount=amount+amt;
	    	
	    		PreparedStatement ps_am=con.prepareStatement("update sel_amount set amount=? where user_name='"+unm+"' ");
				ps_am.setInt(1,tot_amount);
								
				ps_am.executeUpdate();
				ps_am.close();
	    	}
    	}
		ps.close();
		ps_cr.close();
		out.print("<center><h2>Bid confirmed</h2></center>");
       }
       else
       {
    	   out.print("<center><h2>Extra Credit required</h2><a href='images\\pack_details.jsp'><img src='images\\bpack.jpg'></a></center> ");
       }
    }
}catch(Exception e){out.print(e);
}	
%>

</body>
</html>