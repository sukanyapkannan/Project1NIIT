<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>category</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<jsp:include page="Header.jsp"></jsp:include>
<div class="container">
<div class="row">
<h1>Category</h1>
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


<br/>
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
</div>
<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>