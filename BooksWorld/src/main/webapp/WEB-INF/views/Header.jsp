
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

</head>
<body>

<nav class="navbar navbar-inverse" >

    <div class="navbar-header">
      <a class="navbar-brand" href="#">BOOKS WORLD</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="">Home</a></li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="Category">Categories<span class="caret"></span></a>
        <ul class="dropdown-menu">
        <c:forEach items="${clist }" var="c">
          <li><a href="#">${c.catName}</a></li>
          </c:forEach>
        </ul>
      </li>
    </ul>
    
    <form class="navbar-form navbar-left">
      <div class="input-group">
        <input type="text" class="form-control" placeholder="Search">
        <div class="input-group-btn">
          <button class="btn btn-default" type="submit">
            <i class="glyphicon glyphicon-search"></i>
          </button>
        </div>
      </div>
    </form>
    
    <ul class="nav navbar-nav navbar-right">
      <li><a href="SignUp"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="Login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
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