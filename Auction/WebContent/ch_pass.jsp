<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> -->

</head>
<body>
 
<!--scripting part-->


	<!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-1.10.2.js"></script> -->
 
 <%
String utype=session.getAttribute("val").toString();
if(utype.equalsIgnoreCase("admin"))
{
%>
<jsp:include page="admin_home.jsp"></jsp:include> 
<%
}
else
{
%>
<jsp:include page="user_home.jsp"></jsp:include> 
<%
}
%>
<br>
<br>


<br>
<br>
<br>

<!-- jumbotron for contact us--> 
<section id=changePassword>
 <div class="jumbotron jumbotron-fluid p-3 mb-2 bg-light text-dark">
  <div class="container">
    <h1 class="display-4" align="center">Change Password</h1>
     <form action="Profiles" method="post">
     <input type="text" class="form-control" value="changePass" name="ftype" hidden>
    <div class="form-row">
  		<div class="form-group col-md-6">
      		<input type="text" name="oldpass" class="form-control"   placeholder="enter old password " data-rule="minlen:4"   />
  		</div>
  	</div>
  	 <div class="form-row">
 		 <div class="form-group col-md-6">
    		 <input type="text" class="form-control" name="newpass"  placeholder="Your new password" data-rule="minlen:4" />
  		</div>
  	</div>
  	 <div class="form-row">
  	  <div class="form-group col-md-6" class="text-center">
        <input type="text" class="form-control" name="Cnewpass" placeholder="your confirm new password" data-rule="minlen:4" />
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