<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
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
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Categories<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">Clothes</a></li>
          <li><a href="#">Jewellery</a></li>
          <li><a href="#">Electronics</a></li>
        </ul>
      </li>
      <li><a href="#">About us</a></li>
      <li><a href="#">Contact us</a></li>
      <li><a href="admin">Admin</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="#"><span class="glyphicon glyphicon-user"></span>My Cart</a></li>
      <li><a href="Registration"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    </ul>
  </div>
  </nav>
<div class="container">
<h2>Supplier form</h2>
 
<form:form method="post" action="addsupplier" modelAttribute="supplier" > 
  <div class="form-group">
      
      <c:if test="${empty supplier.supplierid}">
      <form:label path="supplierid" class="control-label" for="sid"><spring:message text="sup id"></spring:message></form:label>
     
    <form:input path="supplierid" class="form-control" type="text" id="sid" placeholder="Enter Id"/>
 </c:if> 
      <c:if test="${!empty supplier.supplierid}"> 
        <form:input path="supplierid" type="hidden" value="${supplier.supplierid}" class="form-control" id="id" />
        </c:if>   
    </div>
  <div class="form-group">
      <form:label path="suppliername"  class="control-label col-sm-2" for="sn">Supplier-Name:</form:label>
      <div class="col-sm-10">
        <form:input path="suppliername" type="text" value="${supplier.suppliername}"  class="form-control" id="sn" placeholder="Enter Suppliername" name="sn"/>
       </div>
    </div>
    <div class="form-group">      
       <div class="col-sm-offset-2 col-sm-10">
      <c:if test="${!empty supplier.suppliername}">
      		<a href=""><input type="submit" value="Edit supplier" /></a>
			</c:if>
			<c:if test="${empty supplier.suppliername}">
				<a href=""><input type="submit" value="Add Supplier"/></a>
			</c:if>
        
      
      </div>
    </div> 
    
   
  </form:form>
</div>
<h1>Supplier List</h1>
	<h3>Supplier List</h3>
	<c:if test="${!empty supplierList}">
		<table class="table table-bordered">
			<tr>
				<th width="80">SupplierID</th>
				<th width="120">Supplier Name</th>
			</tr>
			<c:forEach items="${supplierList}" var="supplier">
				<tr>
					<td>${supplier.supplierid}</td>
					<td>${supplier.suppliername}</td>
				   <td><a href="updatesup-${supplier.supplierid}"><button type="button" class="btn btn-primary">Update</button></a></td>
				  <td><a href="deletesup-${supplier.supplierid}"><button type="button" class="btn btn-primary">Delete</button></a></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>


</body>
</html>
