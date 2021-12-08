<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
 <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script src="https://use.fontawesome.com/b32121c496.js"></script>
  <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js'/></script>
<script src='https://cdn.jsdelivr.net/gh/vietblogdao/js/districts.min.js'/></script>


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



<title>Insert title here</title>
<style type="text/css">
.card{
 	width: 100%;
    height: 275px;
    object-fit: cover;  
}
.form-inline{
	width: 100%;
    height: 75px;
}
.container{
	text-align: center;
}

.title{
	margin-top: 35px;
	margin-left: 50px;
}
.form_info{
	margin-left: 150px;
	margin-top:5px;
	padding: 15px 15px;
	
}
.detailAdd{
height: 60px; 
width: 362px;

}
.inputnp{
	width: 193px;
	margin-top: 8px;
}
.total-price table{
	border-top: 3px solid rgb(80, 80, 80);
	width: 100%;
	max-width: 362px;
	margin-top:8px;
	max-height: 120px;
}
.select-op{
	margin-top: 8px;
}
.btn-pay{
	color: #fff;
    padding: 10px 25px;
    background :  rgb(80, 80, 80);
    border: 2px rgb(80, 80, 80);
    border-radius: 20px;
    outline: none;
    cursor: pointer;
    margin-left: 214px;
    margin-top: 8px;
}
.gif-tks{
	margin-left:180px;
	width: 440px;
	height: 356px;
	margin-top: 70px;

}
.all-form{
	display: flex;
	width: 70%;
}

</style>


</head>
<body>
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

<div class="all-form">


	<form class="form_info" action="CartCheckOut" method ="GET">
		<h3 class= "title"> Payment orders </h3>
		<input class="inputnp" type="text" name="name" placeholder="Enter your name"> <br>
 		<input class="inputnp" type="text" name="phone" placeholder="Enter your phone number"> <br>
 		<div class="select-op">
 		<select  name="calc_shipping_provinces" required="">
 	 <option value="">
	Conscious / City</option> 
		</select> 
		<select style="width: 155px;" name="calc_shipping_district" required="">
  	<option value="">District</option>
		</select>
		</div>
		<br>
	<input class="detailAdd" type="text" name="detailAddress" placeholder="Enter your detail address"> <br>
	<div class="total-price">
	<table>
		<tr>
			<td> Total </td>
			
			<td>
				<fmt:setLocale value = "en_US"/>
				<fmt:formatNumber value = "${sessionScope.totalOrder}" type = "currency"/>
			 </td>
		</tr>
		<tr>
			<td> Transportation costs </td>
			<td> 
			<fmt:setLocale value = "en_US"/>
			<fmt:formatNumber value = "${35}" type = "currency"/>
			</td>
		</tr>		
		<tr>
			<td> Total order cost </td>
			<td>
			<fmt:setLocale value = "en_US"/>
		 	 <fmt:formatNumber  value = "${sessionScope.totalOrder+35}" type = "currency"/>  
			 </td>
		<c:set var="totalOrder1" value="${sessionScope.totalOrder+35}" scope="session"/>
		</tr>
	</table>	
	</div>	
   	<button type="submit"  class="btn-pay" onclick="onclick_btn_pay()"  value="Payment orders" > Payment orders </button>
   	</form>
		<img class="gif-tks" src="https://c.tenor.com/3orieGDxeMgAAAAM/gamer.gif" alt="this slowpoke moves"  width="250" />
	</div>
	
</body>
<script>

	if (address_2 = localStorage.getItem('address_2_saved')) {
	  $('select[name="calc_shipping_district"] option').each(function() {
	    if ($(this).text() == address_2) {
	      $(this).attr('selected', '')
	    }
	  })
	  $('input.billing_address_2').attr('value', address_2)
	}
	if (district = localStorage.getItem('district')) {
	  $('select[name="calc_shipping_district"]').html(district)
	  $('select[name="calc_shipping_district"]').on('change', function() {
	    var target = $(this).children('option:selected')
	    target.attr('selected', '')
	    $('select[name="calc_shipping_district"] option').not(target).removeAttr('selected')
	    address_2 = target.text()
	    $('input.billing_address_2').attr('value', address_2)
	    district = $('select[name="calc_shipping_district"]').html()
	    localStorage.setItem('district', district)
	    localStorage.setItem('address_2_saved', address_2)
	  })
	}
	$('select[name="calc_shipping_provinces"]').each(function() {
	  var $this = $(this),
	    stc = ''
	  c.forEach(function(i, e) {
	    e += +1
	    stc += '<option value=' + e + '>' + i + '</option>'
	    $this.html('<option value="">Conscious / City</option>' + stc)
	    if (address_1 = localStorage.getItem('address_1_saved')) {
	      $('select[name="calc_shipping_provinces"] option').each(function() {
	        if ($(this).text() == address_1) {
	          $(this).attr('selected', '')
	        }
	      })
	      $('input.billing_address_1').attr('value', address_1)
	    }
	    $this.on('change', function(i) {
	      i = $this.children('option:selected').index() - 1
	      var str = '',
	        r = $this.val()
	      if (r != '') {
	        arr[i].forEach(function(el) {
	          str += '<option value="' + el + '">' + el + '</option>'
	          $('select[name="calc_shipping_district"]').html('<option value="">District</option>' + str)
	        })
	        var address_1 = $this.children('option:selected').text()
	        var district = $('select[name="calc_shipping_district"]').html()
	        localStorage.setItem('address_1_saved', address_1)
	        localStorage.setItem('district', district)
	        $('select[name="calc_shipping_district"]').on('change', function() {
	          var target = $(this).children('option:selected')
	          target.attr('selected', '')
	          $('select[name="calc_shipping_district"] option').not(target).removeAttr('selected')
	          var address_2 = target.text()
	          $('input.billing_address_2').attr('value', address_2)
	          district = $('select[name="calc_shipping_district"]').html()
	          localStorage.setItem('district', district)
	          localStorage.setItem('address_2_saved', address_2)
	        })
	      } else {
	        $('select[name="calc_shipping_district"]').html('<option value="">District</option>')
	        district = $('select[name="calc_shipping_district"]').html()
	        localStorage.setItem('district', district)
	        localStorage.removeItem('address_1_saved', address_1)
	      }
	    })
	  })
	})



function onclick_btn_pay() {
	localStorage.setItem("CountProductOnCart",0);
	 alert("You have just successfully paid, thank you for choosing us");
}


</script>

</html>




	


















