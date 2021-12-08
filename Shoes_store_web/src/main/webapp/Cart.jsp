<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html >
   <head>
      <!-- basic -->
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <!-- mobile metas -->
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="viewport" content="initial-scale=1, maximum-scale=1">
      <!-- site metas -->
      <title>Shoes</title>
      <meta name="keywords" content="">
      <meta name="description" content="">
      <meta name="author" content="">
      <!-- bootstrap css -->
      <link rel="stylesheet" href="css/bootstrap.min.css">
      <!-- style css -->
      <link rel="stylesheet" href="css/style.css">
      <!-- Responsive-->
      <link rel="stylesheet" href="css/responsive.css">
      <!-- fevicon -->
      <link rel="icon" href="images/fevicon.png" type="image/gif" />
      <!-- Scrollbar Custom CSS -->
      <link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css">
      <!-- Tweaks for older IEs-->
      <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
      <!-- owl stylesheets --> 
      <link rel="stylesheet" href="css/owl.carousel.min.css">
      <link rel="stylesheet" href="css/owl.theme.default.min.css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" media="screen">
      <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
      
      <style type="text/css">
      
      row.image{
      width: 350px;
      height: 280px;
      
      }
  .total-price{
	display: flex;
	justify-content: flex-end;
	margin-right: 2px;
	}
.total-price table{
	border-top: 3px solid rgb(80, 80, 80);
	width: 100%;
	max-width: 410px;
	max-height: 120px;
	}

.btnCheckOut{
	margin-left: auto;
	margin-top: auto;
}
.btnBack{
	display: flex;
	background-color: 	#FFFFFF;
}
  
      </style>
      
   </head>
   <!-- body -->
   <body class="main-layout">
	<!-- header section start -->
	<div class="header_section header_main">
		<div class="container">
			<div class="row">
				<div class="col-sm-3">
					<div class="logo"><a href="#"><img src="images/logo.png"></a></div>
				</div>
				<div class="col-sm-9">
					<nav class="navbar navbar-expand-lg navbar-light bg-light">
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                        </button>
                    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                        <div class="navbar-nav">
                           <a class="nav-item nav-link" href="index.jsp">Home</a>
                           <a class="nav-item nav-link" href="collection.jsp">Collection</a>
                           <a class="nav-item nav-link" href="GetAllShoes">Shoes</a>
                           <a class="nav-item nav-link" href="racingboot.jsp">Racing Boots</a>
                           <a class="nav-item nav-link" href="contact.jsp">Contact</a>
                           <a class="nav-item nav-link last" href="#"><img src="images/search_icon.png"></a>
                           <a class="nav-item nav-link last" href="Cart.jsp"><img src="images/shop_icon.png"></a>
                        </div>
                    </div>
                    </nav>
				</div>
			</div>
		</div>
	</div>
	<!-- New Arrivals section start -->
  <div class="collection_text">Cart</div>
 	<c:set var="total" value="${0}"/>
	<c:set var="trainsportCost" value="${35000}"/>
 		 <table class="table table-hover w-1250">
			<tr class="top-table">
			<td>Shoe </td>
			<td>Price</td>
			<td>Quantity</td>
			<td>Into Price</td>
			<td>Action</td>
		</tr>
		<c:forEach items="${sessionScope.cart}" var="x">
			<tr>
				<td>
				
				 <img src="${x.value.shoes.image}" width="100" />
				 <c:out value="${x.value.shoes.name}"/>
				</td>
				<td>
				<fmt:setLocale value = "en_US"/>
				<fmt:formatNumber value = "${x.value.unitPrice }" type = "currency"/>
				</td>
				<td>
			
	 		 <span  id="QuantiTymiNus" onclick="quantityMinus(${x.key})" > <i class="fa fa-minus"  aria-hidden="true"></i>  </span> 
				<c:out  value="${x.value.quantity }"/>
			 <span  id="QuantiTypLus" onclick="quantityPlus(${x.key})" > <i class="fa fa-plus" aria-hidden="true"> </i> </span>
				</td>
				<td>
				<fmt:setLocale value = "en_US"/>
				<fmt:formatNumber value = "${x.value.quantity * x.value.unitPrice}" type = "currency"/>
				</td>
				<td><a href="DeleteProductFromCart?id=<c:out value='${x.key}'/>">Delete</a></td>
				 <c:set var="total" value="${total + x.value.quantity * x.value.unitPrice}" />
			</tr>
		</c:forEach>
	</table>
    
    	<div class="total-price">
	<table>
		<tr>
			<td> Subtotal </td>
			
			<td>
				<fmt:setLocale value = "en_US"/>
				<fmt:formatNumber value = "${total}" type = "currency"/>
			 </td>
		</tr>
		<tr>
			<td> VAT tax </td>
			<td> 
			<fmt:setLocale value = "en_US"/>
			<fmt:formatNumber value = "${total*5/100}" type = "currency"/>
			</td>
		</tr>		
		<tr>
			<td> Total </td>
			<td>
			<fmt:setLocale value = "en_US"/>
			<fmt:formatNumber  value = "${total*5/100+total}" type = "currency"/>
			 </td>
		</tr>
	</table>	
	<c:set var="totalOrder" value="${total*5/100+total}" scope="session"/>
	
	
	</div>
  	<div class="btnBack">
  	<a  style="color:white;" href="GetAllShoes"type="button" class="btn btn-danger">  Return to shopping </a>
	<div class="btnCheckOut">
	<a style="color:white;" type="button" class="btn btn-danger" href="fCartCheckOut.jsp">  Proceed to checkout </a>
    </div>			
    </div>	
   	<!-- New Arrivals section end -->
	<!-- section footer start -->
    <div class="section_footer">
    	<div class="container">
    		<div class="mail_section">
    			<div class="row">
    				<div class="col-sm-6 col-lg-2">
    					<div><a href="#"><img src="images/footer-logo.png"></a></div>
    				</div>
    				<div class="col-sm-6 col-lg-2">
    					<div class="footer-logo"><img src="images/phone-icon.png"><span class="map_text">(71) 1234567890</span></div>
    				</div>
    				<div class="col-sm-6 col-lg-3">
    					<div class="footer-logo"><img src="images/email-icon.png"><span class="map_text">Demo@gmail.com</span></div>
    				</div>
    				<div class="col-sm-6 col-lg-3">
    					<div class="social_icon">
    						<ul>
    							<li><a href="#"><img src="images/fb-icon.png"></a></li>
    							<li><a href="#"><img src="images/twitter-icon.png"></a></li>
    							<li><a href="#"><img src="images/in-icon.png"></a></li>
    							<li><a href="#"><img src="images/google-icon.png"></a></li>
    						</ul>
    					</div>
    				</div>
    				<div class="col-sm-2"></div>
    			</div>
    	    </div> 
    	    <div class="footer_section_2">
		        <div class="row">
    		        <div class="col-sm-4 col-lg-2">
    		        	<p class="dummy_text"> ipsum dolor sit amet, consectetur ipsum dolor sit amet, consectetur  ipsum dolor sit amet,</p>
    		        </div>
    		        <div class="col-sm-4 col-lg-2">
    		        	<h2 class="shop_text">Address </h2>
    		        	<div class="image-icon"><img src="images/map-icon.png"><span class="pet_text">No 40 Baria Sreet 15/2 NewYork City, NY, United States.</span></div>
    		        </div>
    		        <div class="col-sm-4 col-md-6 col-lg-3">
    				    <h2 class="shop_text">Our Company </h2>
    				    <div class="delivery_text">
    				    	<ul>
    				    		<li>Delivery</li>
    				    		<li>Legal Notice</li>
    				    		<li>About us</li>
    				    		<li>Secure payment</li>
    				    		<li>Contact us</li>
    				    	</ul>
    				    </div>
    		        </div>
    			<div class="col-sm-6 col-lg-3">
    				<h2 class="adderess_text">Products</h2>
    				<div class="delivery_text">
    				    	<ul>
    				    		<li>Prices drop</li>
    				    		<li>New products</li>
    				    		<li>Best sales</li>
    				    		<li>Contact us</li>
    				    		<li>Sitemap</li>
    				    	</ul>
    				    </div>
    			</div>
    			<div class="col-sm-6 col-lg-2">
    				<h2 class="adderess_text">Newsletter</h2>
    				<div class="form-group">
                        <input type="text" class="enter_email" placeholder="Enter Your email" name="Name">
                    </div>
                    <button class="subscribr_bt">Subscribe</button>
    			</div>
    			</div>
    	        </div> 
	        </div>
    	</div>
	<!-- section footer end -->


      <!-- Javascript files-->
      <script src="js/jquery.min.js"></script>
      <script src="js/popper.min.js"></script>
      <script src="js/bootstrap.bundle.min.js"></script>
      <script src="js/jquery-3.0.0.min.js"></script>
      <script src="js/plugin.js"></script>
      <!-- sidebar -->
      <script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
      <script src="js/custom.js"></script>
      <!-- javascript --> 
      <script src="js/owl.carousel.js"></script>
      <script src="https:cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.js"></script>
   </body>
   
<script type="text/javascript">

function quantityMinus(id) {
	var count = sessionStorage.getItem("CountProductOnCart");
	window.location.href='MinusProductFromCart?pID='+id;
}
function quantityPlus(id) {
	var count = sessionStorage.getItem("CountProductOnCart");
	window.location.href='PlusProductFromCart?pID='+id;
	 
}


</script>
   
</html>


