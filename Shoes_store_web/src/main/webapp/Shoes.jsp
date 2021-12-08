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
  <div class="collection_text">Shoes</div>
 
  
    
  <select id="selectManShoes" name="type" onchange="selectMan(this)">
  <option value="st1" >Man Shoes</option>
  <c:forEach items="${listManShoes}" var="x">
  		<option value="${x.id}">${x.name}</option>
  </c:forEach>
  </select>

 <select id="selectWomenShoes" name="type" onchange="selectWomen(this)">
 	<option value="st2">Women Shoes</option>
  <c:forEach items="${listWomenShoes}" var="x">
 	 <option value="${x.id}">${x.name}</option>
  </c:forEach>
  </select>


    <div class="layout_padding gallery_section">
    	<div class="container">
    		<div class="row">
     <c:forEach items="${listShoes}" var="x">
		<div class=" col-sm-4">
			<div class="card">
		   		 <img class="rounded"  src="${x.image}" alt="Card image" >
		   			 <div class="card-body">
		      			<h6 class="card-title">${x.name} </h6>
		      			<p class="bloc-left-price">
		     			   <fmt:setLocale value = "en_US"/>
						<fmt:formatNumber value = "${x.price}" type = "currency" />
		     					 &nbsp;&nbsp;  
		   				  <a href="AddToCart?ShoesID=${x.id}" onclick="AddToCart()" class="btn btn-primary">Add to cart</a>
		     			</p>
		    		</div>
 			 </div>
  		</div>
	 </c:forEach>
    			
    		</div>
    		<div class="buy_now_bt">
    			<button class="buy_text">Buy Now</button>
    		</div>
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
    </div>
	<!-- section footer end -->
	<div class="copyright">2019 All Rights Reserved. <a href="https://html.design">Free html  Templates</a></div>


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
      <script>
         $(document).ready(function(){
         $(".fancybox").fancybox({
         openEffect: "none",
         closeEffect: "none"
         });
         
         
$('#myCarousel').carousel({
            interval: false
        });

        //scroll slides on swipe for touch enabled devices

        $("#myCarousel").on("touchstart", function(event){

            var yClick = event.originalEvent.touches[0].pageY;
            $(this).one("touchmove", function(event){

                var yMove = event.originalEvent.touches[0].pageY;
                if( Math.floor(yClick - yMove) > 1 ){
                    $(".carousel").carousel('next');
                }
                else if( Math.floor(yClick - yMove) < -1 ){
                    $(".carousel").carousel('prev');
                }
            });
            $(".carousel").on("touchend", function(){
                $(this).off("touchmove");
            });
        });
      </script> 
   </body>
   
   <script type="text/javascript">

	if(sessionStorage.getItem("idTypeMan")!=null){
		document.getElementById('selectManShoes').value=sessionStorage.getItem("idTypeMan");
	}
	
	if(sessionStorage.getItem("idTypeWomen")!=null ){
		document.getElementById('selectWomenShoes').value=sessionStorage.getItem("idTypeWomen");
	}




		function selectMan(selectObject){
			var id = selectObject.value;	
			sessionStorage.setItem("idTypeWomen",'st2');
			if(id=='st1'){
				sessionStorage.setItem("idTypeMan",id);
				window.location.href= 'GetAllShoesForMan';
			}else{
				sessionStorage.setItem("idTypeMan",id);
				window.location.href='GetShoesByTypeID?idType='+id;
			}
			
			
		}
		function selectWomen(selectObject){
			var id = selectObject.value;
			sessionStorage.setItem("idTypeMan",'st1');
				if(id=='st2'){
					sessionStorage.setItem("idTypeWomen",id);
					window.location.href='GetAllShoesForWomen';
				}else{
					sessionStorage.setItem("idTypeWomen",id);
					window.location.href='GetShoesByTypeID?idType='+id;
				}
				
		}



</script>
   
</html>


