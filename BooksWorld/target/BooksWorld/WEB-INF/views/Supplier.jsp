<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Supplier</title>

</head>
<body>
<jsp:include page="Header.jsp"></jsp:include>
<div class="container">
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
</div>
</div>
<br/>
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
<td><a href="UpdateSup?supId=${c.supId } }"><span class="glyphicon glyphicon-pencil"></span></a></td>
</tr>
</c:forEach>
</table>
<jsp:include page="Footer.jsp"></jsp:include>

</body>
</html>