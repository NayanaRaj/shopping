<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
      <li><a href="">Contact us</a></li>
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
</body>
</html> --%>