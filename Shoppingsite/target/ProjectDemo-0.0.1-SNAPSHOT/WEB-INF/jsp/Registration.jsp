
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
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

<div class="container">
  <h2>Registration form</h2>
 
  <form:form method="post" modelAttribute="user" action="Register">    
  
  <div class="form-group">
      <form:label  path="Username"  class="control-label col-sm-2" for="un">Username:</form:label>
      <div class="col-sm-10">
        <form:input  path="Username"  type="text" class="form-control" id="un" placeholder="Enter User Name" name="un"/>
      </div>
    </div>
    <div class="form-group">
      <form:label  path="Email"  class="control-label col-sm-2" for="email">Email:</form:label>
      <div class="col-sm-10">
        <form:input  path="Email" type="Email" class="form-control" id="email" placeholder="Enter email" name="email"/>
      </div>
    </div>
    <div class="form-group">
      <form:label path="Password" class="control-label col-sm-2" for="pwd">Password:</form:label>
      <div class="col-sm-10">          
        <form:input path="Password" type="password" class="form-control" id="pwd" placeholder="Enter password" name="pwd" />
      </div>
    </div>
     <div class="form-group">
      <form:label  path="Contactno" class="control-label col-sm-2" for="cno">ContactNo:</form:label>
      <div class="col-sm-10">          
        <form:input  path="Contactno"  type="tel" class="form-control" id="cno" placeholder="Enter Contact No." name="con"/>
      </div>
    </div>
    
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <form:button type="submit" class="btn btn-default">Submit</form:button>
      </div>
    </div>
  </form:form>
</div>

</body>
</html>
