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
<style type="text/css">
.input-1{
	border:1px solid black;
	border-radius:5px;
	height:20px;
}
</style>

<script language="JavaScript">

function check()
{
	pname=document.f1.pname.value;
	pdes=document.f1.pdes.value;
	ctg=document.f1.ctg.value;
	pbprice=document.f1.pbprice.value;
	pcr=document.f1.pcr.value;
	psts=document.f1.psts.value;
	img=document.f1.img.value;
	
		
	if(pname=="")
	{
    	alert("Please enter Item name");
    	document.f1.pname.focus();
    }
    else if(pdes=="")
	{
    	alert("Please description of the item");
    	document.f1.pdes.focus();
    }
    else if(ctg=="-1")
    {
       alert('Please choose category');
    }
   
	else if(pbprice=="")
	{
       alert("Please enter base price of the item");
       document.f1.pbprice.focus();
    }
    else if(isNaN(pbprice))
	{
	   alert("Base price field should contain only digit");
	   document.f1.pbprice.focus();
	}
	else if(pbprice<=0)
    {
    	alert("Base price not equal or less than zero");
    	document.f1.bprice.focus();
    }
    else if(pcr=="")
	{
       alert("Please enter credits");
       document.f1.pcr.focus();
    }
    else if(isNaN(pcr))
	{
       alert("Credits should contain only digit");
       document.f1.pcr.focus();
    }
    else if(pcr<0)
    {
    	alert("Credit not less than zero");
    	document.f1.pcr.focus();
    }
    else if(pcr<0)
    {
    	alert("Credit not less than zero");
    	document.f1.pcr.focus();
    }
    else if(psts=="-1")
    {
    alert("Choose status");
    }
        
    else if(img=="")
    {
    	alert("Image field should not empty");
    	document.f1.img.focus();
    }	
    
    
	else
		document.f1.submit();
}
</script>

</head>
<body>

<jsp:include page="user_home.jsp"></jsp:include> 
<%
int pid=Integer.parseInt(request.getParameter("pnm"));

try
{
 
	Connection con=DBConnection.getConnection();
	
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from product where pr_id='"+pid+"'");
	
	while(rs.next())
	{
		int p_id=rs.getInt(1);
		String p_name=rs.getString(2);
		int p_cid=rs.getInt(3);
		String p_des=rs.getString(4);
		String p_bprice=rs.getString(5);
		String p_cr=rs.getString(6);
		String p_sts=rs.getString(7);
		String p_sdt=rs.getString(8);
		String p_edt=rs.getString(9);
		String p_uname=rs.getString(10);
		
		
%>	
   <form name="f1" method="post" action="edit_product_update.jsp">
   <center>
   <fieldset style="width:30%">
     <table width="703" height="177" border="0">
       <tr>
         <td colspan="3"><img src="edit.png" width="444" height="131"></td>
       </tr>
       <tr>
         <td width="152">Product ID:</td>
         <td width="222"><input type="text" name="pid" value='<%=p_id %>'  class="input-1" readonly ></td>
         <td width="406">&nbsp;</td>
       </tr>
       <tr>
         <td height="29"> Product Name:</td>
         <td><input type="text" name="pname" value='<%=p_name %>' class="input-1"></td>
         <td>&nbsp;</td>
       </tr>
       <tr>
         <td> Product Category:</td>
         <td><input type="text" name="pcid" value='<%=p_cid %>' class="input-1" readonly></td>
         <td><select name="ctg" class="input-1">
        <option value="-1">----Select----</option>
        <%


	Statement s=con.createStatement();
	ResultSet rs1=s.executeQuery("select * from category");
	while(rs1.next())
	{
		int c_id=rs1.getInt(1);
		String c_name=rs1.getString(2);
%>
        <option value=<%=c_id %>><%=c_name %></option>
        <%}
	%>
      </select></td>
       </tr>
       <tr>
         <td>Description:</td>
         <td><input type="text" name="pdes" value='<%=p_des %>' class="input-1"></td>
         <td>&nbsp;</td>
       </tr>
       
       <tr>
         <td>Base Price:</td>
         <td><input type="text" name="pbprice" value='<%=p_bprice %>' class="input-1"></td>
         <td>&nbsp;</td>
       </tr>
       <tr>
         <td>Credits:</td>
         <td><input type="text" name="pcr" value='<%=p_cr %>' class="input-1"></td>
         <td>&nbsp;</td>
       </tr>
       
       <tr>
         <td>Status:</td>
         <td><input type="text" name="psts1" value='<%=p_sts %>' class="input-1" readonly></td>
         <td><select name="psts"><option value="-1">----Select----</option><option value="Open">Open</option><option value="Close">Close</option></select></td>
       </tr>
       <tr>
         <td>Start Date:</td>
         <td><input type="text" name="psdt1" value='<%=p_sdt %>' class="input-1" readonly></td>
         <td><input type="date" name="psdt" id="psdt" required></td>
       </tr>
       <tr>
         <td>End Date:</td>
         <td><input type="text" name="pedt1" value='<%=p_edt %>' class="input-1" readonly></td>
         <td><input type="date" name="pedt" id="pedt" required></td>
       </tr>
       <tr>
         <td>User Name:</td>
         <td><input type="text" name="puname" value='<%=p_uname %>' class="input-1" readonly></td>
         <td>&nbsp;</td>
       </tr> 
       <tr>
         <td>Change Image:</td>
         <td><input type="file" name="img" class="input-1"></td>
         <td>&nbsp;</td>
       </tr>
       <tr>
         <td>&nbsp;</td>
         <td>&nbsp;</td>
         <td><input type="button" value="Update" onClick="check()"></td>
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