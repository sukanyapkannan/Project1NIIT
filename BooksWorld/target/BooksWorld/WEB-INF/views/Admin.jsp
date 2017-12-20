<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Admin</title>
</head>
<body>
<jsp:include page="Header.jsp"></jsp:include>
<div class="container">

 	<h2>Admin</h2>
 	
 	
 	
 	 <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#cat">Category</a></li>
    <li><a data-toggle="tab" href="#sup">Supplier</a></li>
    <li><a data-toggle="tab" href="#pro">Product</a></li>
    
    </ul>

  <div class="tab-content">
    <div id="cat" class="tab-pane fade in active">
    
    <br/>
       <div class="row">
		<form id="category" action="saveCat" method="post" role="form" style="display: block;">
			<div class="form-group">
				<input type="text" name="catname" id="catName" tabindex="2" class="form-control" placeholder="enter category name">
			</div>
			<div class="form-group">
				<input type="text" name="catdescription" id="catdescription" tabindex="2" class="form-control" placeholder="about category">
			</div>

			<div class="col-sm-6 col-sm-offset-3">
				<input type="submit" name="submit" id="submit" tabindex="4" class="form-control btn btn-submit" value="SUBMIT">
			</div>
		</form>
  
        </div>
        <table class="table">
			<tr>
				<th>CATEGORY NAME</th>
				<th>CATEGORY DESCRIPTION</th>
			</tr>

			<c:forEach items="${clist }" var="c">
				<tr class="active">
					<td>${c.catName}</td>
					<td>${c.catdescription }</td>
					<td><a href="DeleteCat?catId=${c.catId }"><span class="glyphicon glyphicon-trash"></span></a></td>
					<td><a href="UpdateCat?catId=${c.catId }"><span class="glyphicon glyphicon-pencil"></span></a></td>
				</tr>
			</c:forEach>

		</table>
  
    </div>
    <div id="sup" class="tab-pane fade">
    
    <br/>
<div class="row">
    <form id="Supplier" action="saveSup" method="post" role="form" style="display: block;">
		<div class="form-group">
			<input type="text" name="SupName" id="SupName" tabindex="2" class="form-control" placeholder="enter Supplier name">
		</div>
		<div class="form-group">
			<input type="text" name="SupAddress" id="SupAddress" tabindex="2" class="form-control" placeholder="enter Address">
		</div>
		<div class="col-sm-6 col-sm-offset-3">
			<input  type="submit" name="submit" id="submit" tabindex="4" class="form-control btn btn-submit" value="SUBMIT">
		</div>
	</form>
      
      <table class="table">
<tr>
<th>SUPPLIER NAME</th>
<th>SUPPLIER ADDRESS</th>

</tr>

<c:forEach items="${slist}" var="c">
	<tr class="active">
	<td>${c.supName}</td>
	<td>${c.supAddress}</td>
	<td><a href="DeleteSup?supId=${c.supId }"><span class="glyphicon glyphicon-trash"></span></a></td>
	<td><a href="UpdateSup?supId=${c.supId }"><span class="glyphicon glyphicon-pencil"></span></a></td>
	</tr>
</c:forEach>
		</table>
      
    </div>
    
    </div>
    <div id="pro" class="tab-pane fade">
      
      <br/>
      <div class="row">
      <form id="Product" action="saveProduct" method="post" role="form" style="display: block;" enctype="multipart/form-data">
			<div class="form-group">
				<input type="text" name="productname" id="productname" tabindex="2" class="form-control" placeholder="enter product name">
			</div>

			<div class="form-group">
				<input type="text" name="productDescription" id="productDescription" tabindex="2" class="form-control" placeholder="about Product">
			</div>

			<div class="form-group">
				<input type="text" name="quantity" id="quantity" tabindex="2" class="form-control" placeholder="enter quantity">
			</div>

			<div class="form-group">
				<input type="text" name="price" id="price" tabindex="2" class="form-control" placeholder="enter price">
			</div>

			<div class="form-group">
					Product Image
					<input type="file" name="img">
			</div>

				<td>Category</td>
	<c:forEach items="${clist }" var="c">

				<td><select name="Category" >
         		<option value="${c.catName }" ></option>
   				    </select></td>

	</c:forEach>


	<c:forEach items="${plist }" var="c">
		<tr class="active">
		<td>${c.productname}</td>
		<td>${c.productDescription }</td>
		<td><a href="deletProdudct?id=${c.id }"><span class="glyphicon glyphicon-trash"></span></a></td>
		<td><a href="updateProduct?id=${c.id }"><span class="glyphicon glyphicon-pencil"></span></a></td>
		</tr>
	</c:forEach>

	<div class="col-sm-6 col-sm-offset-3">
		<input type="submit" name="submit" id="submit" tabindex="4" class="form-control btn btn-submit" value="SUBMIT">
	</div>
</form>
      
    </div>
    
  </div>
 </div>
 
</div>

    <jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>