<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
  
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Shopping Site</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="home">Home</a></li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="">Categories<span class="caret"></span></a>
        <ul class="dropdown-menu">
         <c:if test="${!empty hcatlist}">
		
					<c:forEach items="${hcatlist}" var="catList">	
					<li>${catList.categoryname}</li>
					</c:forEach>
					</c:if>
        </ul>
      </li>
      <li><a href="aboutus">About us</a></li>
      <li><a href="contact">Contact us</a></li>
      <c:if test="${pageContext.request.userPrincipal.name == 'Nayana'}">
      <li>
      
      <a href="admin">Admin</a>
      </li>
      </c:if>
    </ul>
    <ul class="nav navbar-nav navbar-right">
   <c:if test="${pageContext.request.userPrincipal.name  != null}">
			<li><a>Hello, ${pageContext.request.userPrincipal.name}</a></li>
     
          <li><a href="<c:url value="/j_spring_security_logout"/>"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
    </c:if>
    <c:if test="${pageContext.request.userPrincipal.name  == null}">
				
					<li><a href="loginUser"><span
							class="glyphicon glyphicon-log-in" aria-hidden="true">Login</span></a></li>
					<li><a href="Registration"><span
							class="glyphicon glyphicon-log-out" aria-hidden="true">SignUp</span></a></li>
				</c:if>
					 <c:if test="${pageContext.request.userPrincipal.name != 'abc'}">
					 <c:if test="${pageContext.request.userPrincipal.name  != null}">
					 
				<li><a href="<c:url value="/myCart" />"><span class="glyphicon glyphicon-shopping-cart"></span> MyCart</a>${cartSize}</li>
			</c:if>
			</c:if>
    </ul>
  </div>
</nav>
<div class="container">
  <h2>Product Images</h2>
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
     
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">

      <div class="item active">
        <img src="resources/images/24.jpg" alt="dress" style="width:100%;">
        <div class="carousel-caption">
          <h3>slippers</h3>
          <p>pumps,peeptoes,sandals</p>
        </div>
      </div>

     
      <div class="item">
        <img src="resources/images/23.jpg" alt="jewellary" style="width:100%;">
        <div class="carousel-caption">
          <h3>Dresses</h3>
          <p>Variety of sarees,kurta,pants,tops</p>
        </div>
      </div>
      
       
      
     
      <div class="item">
        <img src="resources/images/21.jpg" alt="shopping" style="width:100%;">
        <div class="carousel-caption">
          <h3>jewels</h3>
           
            </div>
      </div>
      <div class="item">
        <img src="resources/images/22.jpg" alt="electronic devices" style="width:100%;">
        <div class="carousel-caption">
          <h3>Computer system</h3>
         
            </div>
      </div>
   </div>
   
        <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    
    </a>
  </div>
</div>
<div class="container">
<div class="row">
	
		
			
				
				
				<c:if test="${!empty hproList}">
		
					<c:forEach items="${hproList}" var="homeproductList">	
					
					
					<div class="col-md-4">
						<div class="thumbnail">
							<a href="propage-${homeproductList.id}"><img alt="Bootstrap Thumbnail First" src="resources/images/${homeproductList.id}.jpg" /></a>
							<div class="caption">
								<h3>${homeproductList.name}</h3>
								<h7>${homeproductList.description}</h7>
								<h5>Rs ${homeproductList.price}</h5>
								<p>
									<%-- <a class="btn btn-primary" href="<c:url value='homepro${homeproductList.id}'/>">More</a>  --%>
									<a	class="btn btn-primary" href="payment">Buy now</a>
									<a	class="btn btn-primary" href="cart/add/${homeproductList.id}">Add to cart</a>
								</p>
							</div>

						</div>
					</div>
					
					</c:forEach>
				
				</c:if>		



</div>
</div>
<!-- 


<div class="container">
  <h2>Image Gallery</h2>
  <p>In image gallery we can see the variety of things like dress,<br>cosmetics,electronic devices,jewels etc</p>
   <div class="row">
    <div class="col-md-4">
      <div class="thumbnail">
          <img src="resources/images/14.jpg" alt="Mobiles" style="width:100%">
          <div class="caption">
      <button type="button" class="btn btn-primary btn-block">Buy Now</button>
      <button type="button" class="btn btn-primary btn-block">Add to cart</button>
          </div>
        </a>
      </div>
    </div>
    <div class="col-md-4">
      <div class="thumbnail">
          <img src="resources/images/7.jpg" alt="sandals" style="width:100%">
          <div class="caption">
            <button type="button" class="btn btn-primary btn-block">Buy Now</button>
            <button type="button" class="btn btn-primary btn-block">Add to cart</button>
          </div>
        </a>
      </div>         
    </div>
    <div class="col-md-4">
      <div class="thumbnail">
        <a href="/w3images/fjords.jpg" target="_blank">
          <img src="resources/images/6.jpg" alt="slippers" style="width:100%">
          <div class="caption">
           <button type="button" class="btn btn-primary btn-block">Buy Now</button>
           <button type="button" class="btn btn-primary btn-block">Add to cart</button>
          </div>
        </a>
      </div>
    </div>
  </div>
</div>
<div class="container">
  <div class="row">
    <div class="col-md-4">
      <div class="thumbnail">
        <a href="">
          <img src="resources/images/2.jpg" alt="clothes" style="width:100%">
          <div class="caption">
            <button type="button" class="btn btn-primary btn-block">Buy Now</button>
            <button type="button" class="btn btn-primary btn-block">Add to cart</button>
          </div>
        </a>
      </div>
    </div>
    <div class="col-md-4">
      <div class="thumbnail">
        <a href="">
          <img src="resources/images/3.jpg" alt="jewels" style="width:100%">
          <div class="caption">
            <button type="button" class="btn btn-primary btn-block">Buy Now</button>
            <button type="button" class="btn btn-primary btn-block">Add to cart</button>
          </div>
        </a>
      </div>
    </div>
    <div class="col-md-4">
      <div class="thumbnail">
        <a href="">
          <img src="resources/images/10.jpg" alt="Makeup kit" style="width:100%">
          <div class="caption">
            <button type="button" class="btn btn-primary btn-block">Buy Now</button>
            <button type="button" class="btn btn-primary btn-block">Add to cart</button>
          </div>
        </a>
      </div>
    </div>
  </div>
</div>

 -->
 
</body>
</html>
    