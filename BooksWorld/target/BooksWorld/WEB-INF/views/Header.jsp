
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>

</head>
<body>

<nav class="navbar navbar-inverse" >

    <div class="navbar-header">
      <a class="navbar-brand" href="./">BOOKS WORLD</a>
    </div>
    
    <ul class="nav navbar-nav">
      <c:if test="${pageContext.request.userPrincipal.name  != 'admin123@gmail.com'}">
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="Category">Categories<span class="caret"></span></a>
        <ul class="dropdown-menu">
        <c:forEach items="${clist }" var="c">
          <li><a href="proList?catId=${c.catId }">${c.catName}</a></li>
          </c:forEach>
        </ul>
      </li>
      </c:if>
       <c:if test="${pageContext.request.userPrincipal.name  == 'admin123@gmail.com'}">
    		<li><a href="Admin">Admin Action</a></li>
     </c:if>
     
    <c:if test="${pageContext.request.userPrincipal.name  != null}">
    <li><a href="ProductList">Product List</a></li>
    </c:if>
    </ul>
    
    <ul class="nav navbar-nav navbar-right">
    
       <c:if test="${pageContext.request.userPrincipal.name == null }">
      		  <li><a href="SignUp"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
       </c:if>
       <c:if test="${pageContext.request.userPrincipal.name == null }">
     		  <li><a href="Login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
       </c:if>
       <c:if test="${pageContext.request.userPrincipal.name  != null}">
					<li><a>Welcome: ${pageContext.request.userPrincipal.name}</a></li>
      		  <li><a href="j_spring_security_logout"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
       </c:if>
    </ul>
       <p>
        <button type="button" class="btn btn-default btn-sm">
          <span class="glyphicon glyphicon-shopping-cart"></span> Shopping Cart
        </button>
      </p>
  
</nav>

<style>
#ntext{
 color: #000000;
  }
</style>

</body>
</html>