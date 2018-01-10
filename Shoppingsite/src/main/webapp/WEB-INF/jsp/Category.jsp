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
<h2>Category form</h2>
 
<form:form method="post" action="addcategory" modelAttribute="category" > 
 
    <div class="form-group">
      
      <c:if test="${empty category.categoryid}">
      <form:label path="categoryid" class="control-label" for="cid"><spring:message text="cat id"></spring:message></form:label>
     
    <form:input path="categoryid" class="form-control" type="text" id="cid" placeholder="Enter Id"/>
 </c:if> 
      <c:if test="${!empty category.categoryid}"> 
        <form:input path="categoryid" type="hidden" value="${category.categoryid}" class="form-control" id="cid" />
        </c:if>   
    </div>
    <div class="form-group">
      <form:label path="categoryname"  class="control-label" for="cn">Category-Name:</form:label>
          
        <form:input path="categoryname" type="text"  value="${category.categoryname}"  class="form-control" id="cn" placeholder="Enter categoryname" name="cn"/>
     
    </div>
       
  
    <div class="form-group">      
    <div class="col-sm-offset-2 col-sm-10">
      <c:if test="${!empty category.categoryname}">
      		<input type="submit" value="<spring:message text="Edit Category"/>" />
			</c:if>
			<c:if test="${empty category.categoryname}">
				<input type="submit"
					value="<spring:message text="Add Category"/>" />
			</c:if>
        
      </div>
    </div> 
    </form:form>

<h1>Category List</h1>
	<h3>Category List</h3>
	<c:if test="${!empty categoryList}">
	
		<table class="table table-bordered">
			<tr>
				<th width="80">Category ID</th>
				<th width="120">Category Name</th>
			</tr>
			<c:forEach items="${categoryList}" var="cat">
				<tr>
					<td>${cat.categoryid}</td>
					<td>${cat.categoryname}</td>
					 <td><a href='editcategory-${cat.categoryid}'/><button type="button" class="btn btn-primary">update</button></td>
					<td><a href='delete-${cat.categoryid}'/><button type="button" class="btn btn-primary">Delete</button></td>
					</tr>
			</c:forEach> 
		</table> 
	</c:if>


</body>
</html>
