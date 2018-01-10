
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
     <%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
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
      </ul></div></nav>
<div class="container">
  <h2>Add Product</h2>
 
  <form:form method="post" modelAttribute="product" action="addproduct"  enctype="multipart/form-data">    
  
  <div class="form-group">
      
      <c:if test="${empty product.id}">
      <form:label path="id" class="control-label" for="pid"><spring:message text="pro id"></spring:message></form:label>
     
    <form:input path="id" class="form-control" type="text" id="cid" placeholder="Enter Id"/>
 </c:if> 
      <c:if test="${!empty product.id}"> 
        <form:input path="id" type="hidden" value="${product.id}" class="form-control" id="id" />
        </c:if>   
    </div>
    <div class="form-group">
      <form:label  path="name" class="control-label col-sm-2" for="name">name:</form:label>
      <div class="col-sm-10">
        <form:input  path="name"   value="${product.name}" type="text" class="form-control" id="name" placeholder="Enter name" name="name"/>
      </div>
    </div>
    <div class="form-group">
      <form:label path="description" class="control-label col-sm-2" for="des">Description:</form:label>
      <div class="col-sm-10">          
        <form:input path="description"  value="${product.description}" type="text" class="form-control" id="des" placeholder="Enter description" name="des" />
      </div>
    </div>
     <div class="form-group">
      <form:label  path="price" class="control-label col-sm-2" for="p">Price:</form:label>
      <div class="col-sm-10">          
        <form:input  path="price"  value="${product.price}" type="number" class="form-control" id="p" placeholder="Enter price" name="pr"/>
      </div>
    </div>
    
    <div class="form-group">
	<label for="ID">Supplier</label>
	<form:select path="supplier.suppliername" cssClass="form-control" items="${supplierList}" itemLabel="suppliername" itemValue="suppliername"></form:select>
	</div>
	<div class="form-group">
	<label for="ID">Category</label>
	<form:select path="category.categoryname" cssClass="form-control" items="${categoryList}" itemLabel="categoryname" itemValue="categoryname"></form:select>
       </div>
       
       
     <div class="form-group">
      <form:label  path="pimage" class="control-label col-sm-2" >Image:</form:label>
      <div class="col-sm-10">          
        <form:input  path="pimage" type="file" class="form-control"  placeholder="select an image" />
      </div>
    </div>
   
     <div class="form-group">      
    <div class="col-sm-offset-2 col-sm-10">
      <c:if test="${!empty product.name}">
      		<a href=""><input type="submit"
					value="<spring:message text="Edit Product"/>" /></a>
			</c:if>
			<c:if test="${empty product.name}">
				<a href=""><input type="submit"
					value="<spring:message text="Add Product"/>" /></a>
			</c:if>
        
      </div>
    </div> 
  </form:form>
</div>
<h1>Product List</h1>
	<h3>Product List</h3>
	<c:if test="${!empty productList}">
		<table class="table table-bordered">
			<tr>
				<th width="80">Product ID</th>
				<th width="120">Product Name</th>
				<th width="200">Product Description</th>
				<th width="80">Price</th>
				<th>Image</th>
				<th width="200">Category</th>
				<th width="80">Supplier</th>
			</tr>
			<c:forEach items="${productList}" var="product">
				<tr>
					<td>${product.id}</td>
					<td>${product.name}</td>
					<td>${product.description}</td>
					<td>${product.price}</td>
					 <td><img src="resources/images/${product.id}.jpg" style="width: 150px; height: 100px;"></td>
					  <td>${product.category.categoryname}</td>
                       <td>${product.supplier.suppliername}</td>
					<td><a href="updatepro-${product.id}"><button  class="btn btn-primary" name="button" value="OK" type="button">Update</button></a></td>
					<td><a href="deletepro-${product.id}"><button class="btn btn-primary" name="button" value="OK" type="button">Delete</button></a></td> 
				</tr>
			</c:forEach>
		</table>
	</c:if>

 
</body>
</html>
