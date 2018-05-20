<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript"> 
function check()
{
	cname=document.f1.cname.value;
	cdes=document.f1.cdes.value;
		
	if(cname=="")
	{
    alert("Please enter category name");
    document.f1.cname.focus();
    }
    else if(cdes=="")
	{
    alert("Please enter description");
    document.f1.cdes.focus();
    }
   	else
		document.f1.submit();
}
</script>
</head>
<body>
<jsp:include page="admin_home.jsp"></jsp:include>
<br>
<br>
<br>
<br>
<Br>
<%
	
	String s=request.getSession().getAttribute("result").toString();
	if(s.equalsIgnoreCase("success"))
	{
	%>
		 
		<center><h2>Category information has been succesfully created.</h2></center>
		 
	<% 
		
	}
	

%>
<br>
<br>

<!-- jumbotron for contact us--> 
<section id=addCategory>
 <div class="jumbotron jumbotron-fluid p-3 mb-2 bg-light text-dark">
  <div class="container">
    <h1 class="display-4" align="center">Add Category</h1>
     <form action="Categories" method="get">
     <input type="text" class="form-control" value="addCategory" name="ftype" hidden>
    <div class="form-row">
  		<div class="form-group col-md-6">
  			  <label for="category">Category</label>
      		<input type="text" name="cat" class="form-control"   placeholder="enter Your Category" data-rule="minlen:4"  required >
  		</div>
  	</div>
  	 <div class="form-row">
 		 <div class="form-group col-md-6">
 		 	<label for="desc">Description</label>
    		 <input type="text" class="form-control" name="cdes"  placeholder="enter description" data-rule="minlen:4" required>
  		</div>
  	</div>
  	 
 
    <div class="text-center"> 
  		<button type="submit" class="btn btn-dark"  value="Add Category" onClick="check()">Submit</button>
	</div>
</form>
  </div>
</div>
</section>


</body>
</html>