<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cart:SKart.in</title>
</head>
<style>
body{
background-image: url(resources/images/k4.jpg);
background-size:     cover;                      
    background-repeat:   no-repeat;
}
th{
    color:white;
    background-color:black;
    
}
table, th, td {
    border: 1px solid black;
    align:center;
}
h2{
color:black;
font-family: "Times New Roman", Times, serif;
}
</style>

<body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" >SKart</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="homepage"><span class="glyphicon glyphicon-home"></span></a></li>
	 
     </ul>
     <ul class="nav navbar-nav navbar-right">
      
      <li class="divider-vertical"></li>
		<c:if test="${pageContext.request.userPrincipal.name != null}">
			
			
			
			<c:if test="${pageContext.request.userPrincipal.name  == 'admin'}">
				<li><a href="<c:url value="/admin" />">View ALL</a></li>
			</c:if>
			
			<li><a>Hello, ${pageContext.request.userPrincipal.name}</a></li>
			<li><a href="<c:url value="/j_spring_security_logout" />"> <span class="glyphicon glyphicon-log-out"></span> Log Out</a></li>
		</c:if>
								
		<c:if test="${pageContext.request.userPrincipal.name  == null}">
			<li><a href="<c:url value="/loginUser" />"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
			<li><a href="<c:url value="memberShip.obj" />"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
		</c:if>
        
  </div>
</nav>



 <div class="container-fluid">
	<h3><center>YOUR CART</center></h3>
	<br>
	<br>
	
	
	<c:if test="${!empty cartList}">
		<table  class="table table-condensed"  align="center">
			<tr>
				<th  width="125">Product Name</th>
				<th  width="125">Image</th> 
				<th  width="125">Price</th>
				
				<th width="125" align="center">Delete</th>
				
			</tr>
			<c:forEach items="${cartList}" var="cart">
				<tr>
					<td  align="center">${cart.productName}</td>
					<td><img src="<c:url value="resources/image/${cart.cartproduct_id}.jpg"/>" style="width: 100px;"></td>
					<td  align="center">${cart.price}</td>
					
					
					
					
					<td align="center"><a href="<c:url value='cart/delete/${cart.id}' />"><button type="button" class="btn btn-default">Delete</button></a></td>
				</tr>
			</c:forEach>
		</table>
	
	</c:if>
	</div>
	<br>
	<br>
			<c:if test="${pageContext.request.userPrincipal.name  != null}">
		<h2><center> Total:${sum}</center></h2>
		</c:if>
	
	<div style="text-align: center;">
	
	<a href="homepage"><button type="button" class="btn btn-default" align="center">CONTINUE SHOPPING</button>
	</h4></a>
	
	
	<br>
	<br>
	<c:if test="${!empty cartList}">
	<a href="payment"><h4 style="color: #c19a6b "><button type="button" class="btn btn-default">Checkout and Pay</button></h4></a>
	</c:if>
	</div>
</body>
</html> --%>