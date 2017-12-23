
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CategoryUp</title>

</head>
<body style="background-image: url('${pageContext.request.contextPath}/resources/backgd.jpg');">

<jsp:include page="Header.jsp"></jsp:include>
<div class="container">
<div class="row">
<h1>Category  </h1>
<form id="category" action="editCat" method="post" role="form" style="display: block;height: 63vh" var="c">
<div class="form-group">
<input type="text" name="catname" id="catName" tabindex="2" class="form-control" value="${cate.catName }">
</div>
<div class="form-group">
<input type="text" name="catdescription" id="catdescription" tabindex="2" class="form-control" value="${cate.catdescription }">
<input type="hidden" name="catid" value="${cate.catId }"> 
</div>
<div class="col-sm-6 col-sm-offset-3">
<input type="submit" name="submit" id="submit" tabindex="4" class="form-control btn btn-submit" value="SUBMIT">
</div>
</form>
</div>
</div>

<jsp:include page="Footer.jsp"></jsp:include>
 
</body>
</html>