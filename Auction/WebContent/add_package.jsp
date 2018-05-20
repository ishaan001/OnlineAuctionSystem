<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="admin_home.jsp"/>


<br>
<br>
<br>
<%
	
	String s=request.getSession().getAttribute("result").toString();
	if(s.equalsIgnoreCase("success"))
	{
	%>
		 
		<center><h2>Package has been successfully created.</h2></center>
		 
	<% 
		
	}
	

%>
<!-- jumbotron for contact us--> 
<section id=changePassword>
 <div class="jumbotron jumbotron-fluid p-3 mb-2 bg-light text-dark">
  <div class="container">
    <h1 class="display-4" align="center">Add Package</h1>
     <form action="Categories" method="get">
     <input type="text" class="form-control" value="addPackage" name="ftype" hidden>
    <div class="form-row">
  		<div class="form-group col-md-6">
  			<label for="category">Package Name</label>
      		<input type="text" name="pname" class="form-control"   placeholder="enter package name " data-rule="minlen:4"  required >
  		</div>
  	</div>
  	 <div class="form-row">
 		 <div class="form-group col-md-6">
    		<label for="category">Package Credit</label>
    		 <input type="text" class="form-control" name="pcredit"  placeholder="enter package credit" data-rule="minlen:4" required>
  		</div>
  	</div>
  	 <div class="form-row">
  	  <div class="form-group col-md-6" class="text-center">
        <label for="category">Package Price</label>
        <input type="text" class="form-control" name="price" placeholder="enter package price" data-rule="minlen:4" required >
      </div>
      </div>
       <div class="form-row">
  	  <div class="form-group col-md-6" class="text-center">
        <label for="category">Package Image</label>
        <input type="file" class="form-control" name="pimg" placeholder="upload image" data-rule="minlen:4" required>
      </div>
      </div>
 
    <div class="text-center"> 
  		<button type="submit" class="btn btn-dark">Submit</button>
	</div>
</form>
  </div>
</div>
</section>

</body>
</html>