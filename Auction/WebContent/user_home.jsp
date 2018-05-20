<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<!--navigation bar-->
	 <nav class="navbar navbar-expand-lg navbar navbar-dark bg-dark navbar fixed-top ">
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <a class="navbar-brand" href="#">Bid CLAP</a>

  <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
      <li class="nav-item ">
        <a class="nav-link" href="cofirm_id.jsp">Buy product<span class="sr-only">(current)</span></a>
      </li>
 
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          My Account
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="ch_pass.jsp">Change Password</a>
          <a class="dropdown-item" href="edit_profile.jsp">Edit Account</a>
          <a class="dropdown-item" href="ac_statistics.jsp">Statistics</a>
        </div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Seller
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="add_auc_item.jsp">Add Auction Item</a>
          <a class="dropdown-item" href="s_amt_detail.jsp">Balance Amount</a>
           <a class="dropdown-item" href="s_credit_detail.jsp">Credit Details</a>
          <a class="dropdown-item" href="edit_prd_search.jsp">Edit Item</a>
          <a class="dropdown-item" href="s_conf_history.jsp">Confirmation History</a>
          
        </div>
      </li> 
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Buyer
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="bid_log.jsp">Bid Log</a>
          <a class="dropdown-item" href="buy_confirm.jsp">Confirmation History</a>
           
        </div>
      </li>
       
      <li class="nav-item">
        <a class="nav-link" href="pack_details.jsp">Package Topup</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="pr_details.jsp">Live Auction</a>
      </li>
      
       
    </ul>
    <form class="form-inline my-2 my-lg-0">
     <!--  	<div><button type="button" class="btn btn-outline-success my-2 my-sm-0" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">Login</button>
    </div>  -->   
        &nbsp;
         <button type="button" class="btn btn-outline-success my-2 my-sm-0" onclick="window.location.href='logout.jsp'">Logout</button>
    </form>
  </div>
</nav>
<br>
<br>
<center>
<img alt="admin" src="images\\userWelcome.jpg">
</center>
<!-- <a href="pr_details.jsp"><img alt="" src="images\\hand-btn.png"></a> -->

<br>
<br>




</body>
</html>