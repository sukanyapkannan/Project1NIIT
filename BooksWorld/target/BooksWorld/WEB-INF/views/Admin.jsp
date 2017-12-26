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
<body style="background-image: url('${pageContext.request.contextPath}/resources/4.jpeg');">
<jsp:include page="Header.jsp"></jsp:include>
<div class="container">

 	<h2>Admin</h2>
 
 	 <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#cat">Category</a></li>
    <li><a data-toggle="tab" href="#sup">Publisher</a></li>
    <li><a data-toggle="tab" href="#pro">Books</a></li>
    
    </ul>

  <div class="tab-content">
    <div id="cat" class="tab-pane fade in active">
    
    <br/>
       <div class="row">
		<form id="category" action="saveCat" method="post" role="form" style="display: block;">
			<div class="form-group">
				<input type="text" name="catname" id="catName" tabindex="2" class="form-control" placeholder="enter category name" required>
			</div>
			<div class="form-group">
				<input type="text" name="catdescription" id="catdescription" tabindex="2" class="form-control" placeholder="about category" required>
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
			<input type="text" name="SupName" id="SupName" tabindex="2" class="form-control" placeholder="Enter Publisher name">
		</div>
		<div class="form-group">
			<input type="text" name="SupAddress" id="SupAddress" tabindex="2" class="form-control" placeholder="Enter Address">
		</div>
		<div class="col-sm-6 col-sm-offset-3">
			<input  type="submit" name="submit" id="submit" tabindex="4" class="form-control btn btn-submit" value="SUBMIT">
		</div>
	</form>
      
      <table class="table">
<tr>
<th>PUBLISHER NAME</th>
<th>PUBLISHER ADDRESS</th>

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
				<input type="text" name="productname" id="productname" tabindex="2" class="form-control" placeholder="Enter Book name">
			</div>

			<div class="form-group">
				<input type="text" name="productDescription" id="productDescription" tabindex="2" class="form-control" placeholder="About the Book">
			</div>

			<div class="form-group">
				<input type="number" name="quantity" id="quantity" tabindex="2" class="form-control" placeholder="enter quantity">
			</div>

			<div class="form-group">
				<input type="number" name="price" id="price" tabindex="2" class="form-control" placeholder="enter price">
			</div>

			

				<div class="form-group">
				    Choose Category: 
     			<select name="cid">
                    <option>SELECT CATEGORY</option>
        			<c:forEach items="${clist }" var="c">
     						 <option value="${c.catId}">${c.catName}</option>
         			 </c:forEach>
                 </select>

               </div>
               
				<div class="form-group">
				    Choose Publisher: 
     			<select name="sid">
                    <option>SELECT PUBLISHER</option>
        			<c:forEach items="${slist }" var="c">
     						 <option value="${c.supId}">${c.supName}</option>
         			 </c:forEach>
                 </select>

               </div>
            <div class="form-group">
					BOOK Image
					<input type="file" name="img">
			</div>
 			<div class="form-group">
					
					<input type="submit" class="button">
			</div>

</form>
 <table class="table">
			<tr>
				<th>IMAGE</th>
				<th>BOOK NAME</th>
				<th>BOOK DESCRIPTION</th>
				<th>CATEGORY</th>
				<th>PUBLISHER</th>
				<th>QUANTITY</th>
				<th>PRICE</th>
				
				
			</tr>

			<c:forEach items="${plist }" var="c">
				<tr class="active">
				<td> <img src="${pageContext.request.contextPath}/resources/images/${c.id }.jpg" style="width:200px;height: 200px;"></td>
					<td>${c.productname}</td>
					<td>${c.productDescription }</td>
					<td>${c.category.catName }</td>
					<td>${c.supplier.supName }</td>
					<td>${c.quantity}</td>
					<td>${c.price}</td>
					<td><a href="DeleteProduct?id=${c.id }"><span class="glyphicon glyphicon-trash"></span></a></td>
					<td><a href="UpdateProduct?id=${c.id }"><span class="glyphicon glyphicon-pencil"></span></a></td>
				</tr>
			</c:forEach>
		</table>
    </div>
  </div>
 </div>
</div>
</br></br></br></br></br></br></br>
    <jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>