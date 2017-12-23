<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
    

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Product Form</title>
</head>
<body style="background-image: url('${pageContext.request.contextPath}/resources/backgd.jpeg');">
<jsp:include page="Header.jsp"></jsp:include>

<div class="container">
<div>
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
<div class="form-group">
${clist }
     <select name="cid">
     
        <c:forEach items="${clist }" var="c">
      <option><a href="#">${c.catName}</a></option>
          </c:forEach>
      </select>

 </div>


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

<br/>
<table class="table">
<tr>
<th>PRODUCT NAME</th>
<th>PRODUCT DESCRIPTION</th>
</tr>

<c:forEach items="${plist }" var="c">
<tr class="active">
<td>${c.productname}</td>
<td>${c.productDescription}</td>
<td><a href="deletProdudct?id=${c.id}"><span class="glyphicon glyphicon-trash"></span></a></td>
<td><a href="updateProduct?id=${c.id}"><span class="glyphicon glyphicon-pencil"></span></a></td>
</tr>
</c:forEach>


</table>
</div>
</div>

<jsp:include page="Footer.jsp"></jsp:include>

</body>
</html>