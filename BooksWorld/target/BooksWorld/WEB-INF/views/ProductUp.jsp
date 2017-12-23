<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ProductUp</title>
</head>
<jsp:include page="Header.jsp"></jsp:include>
<body style="background-image: url('${pageContext.request.contextPath}/resources/backgd.jpg');">

<div class="container">
<table align="center">
<div class="row">
      <form id="Product" action="EditProduct" method="post" role="form" style="display: block;" enctype="multipart/form-data">
			<div class="form-group">
				<input type="text" name="productname" id="productname" tabindex="2" class="form-control" value="${Prod.productname }">
			</div>

			<div class="form-group">
				<input type="text" name="productDescription" id="productDescription" tabindex="2" class="form-control" value="${Prod.productDescription }">
			</div>

			<div class="form-group">
				<input type="number" name="quantity" id="quantity" tabindex="2" class="form-control" value="${Prod.quantity }">
			</div>

			<div class="form-group">
				<input type="number" name="price" id="price" tabindex="2" class="form-control" value="${Prod.price }">
			</div>
		<input type="hidden" name="id" value="${Prod.id }"> 
			

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
  </div>
  </table>
  </div>
  
    <jsp:include page="Footer.jsp"></jsp:include>

</body>
</html>