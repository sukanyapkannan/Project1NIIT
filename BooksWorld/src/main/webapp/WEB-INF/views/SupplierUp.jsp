<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SupplierUp</title>
</head>
<body>
<jsp:include page="Header.jsp"></jsp:include>

<div class="container">
<div class="row">
<form id="Supplier" action="UpdateSup" method="post" role="form" style="display: block;">
<div class="form-group">
<input type="text" name="SupName" id="SupName" tabindex="2" class="form-control" placeholder="${supp.supName }">
</div>
<div class="form-group">
<input type="text" name="SupAddress" id="SupAddress" tabindex="2" class="form-control" placeholder="${supp.supAddress }">
<input type="hidden" name="supId" value="${supp.supId }"> 
</div>
<div class="col-sm-6 col-sm-offset-3">
<input  type="submit" name="submit" id="submit" tabindex="4" class="form-control btn btn-submit" value="SUBMIT">
</div>
</form>
</div>
</div>
<jsp:include page="Footer.jsp"></jsp:include>

</body>
</html>