<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Products</title>
</head>



<style type="text/css">
.glyphicon { margin-right:5px; }
.thumbnail
{
    margin-bottom: 20px;
    padding: 0px;
    -webkit-border-radius: 0px;
    -moz-border-radius: 0px;
    border-radius: 0px;
}

.item.list-group-item
{
    float: none;
    width: 100%;
    background-color: #fff;
    margin-bottom: 10px;
}
.item.list-group-item:nth-of-type(odd):hover,.item.list-group-item:hover
{
    background: #428bca;
}

.item.list-group-item .list-group-image
{
    margin-right: 10px;
}
.item.list-group-item .thumbnail
{
    margin-bottom: 0px;
}
.item.list-group-item .caption
{
    padding: 9px 9px 9px 9px;
}
.item.list-group-item:nth-of-type(odd)
{
    background: #eeeeee;
}

.item.list-group-item:before, .item.list-group-item:after
{
    display: table;
    content: " ";
}

.item.list-group-item img
{
    float: left;
}
.item.list-group-item:after
{
    clear: both;
}
.list-group-item-text
{
    margin: 0 0 11px;
}

</style>


<jsp:include page="Header.jsp"></jsp:include>
<body style="background-image: url('${pageContext.request.contextPath}/resources/light.jpg');">

<div class="container">

   
    <div id="product" class="row list-group">
      <c:forEach items="${plist}" var="p">
        <div class="item  col-xs-4 col-lg-4">
            <div class="thumbnail" style="width:200px;height: 200px">
                <img class="group list-group-image" src="${pageContext.request.contextPath}/resources/images/${p.id}.jpg"  alt="" />
                <div class="caption">
                    <h4 class="group inner list-group-item-heading">
                       ${p.productname}</h4>
                    <div class="row">
                        <div class="col-xs-12 col-md-6">
                            <p class="lead">
                                $ ${p.price}</p>
                        </div>
                        <div class="col-xs-12 col-md-6">
                            <a class="btn btn-success" href="productDescp?id=${p.id}&error=">More Info</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        
        </c:forEach>
       
        
    </div>
</div>
<script type="text/javascript">

$(document).ready(function() {
    $('#list').click(function(event){event.preventDefault();$('#products .item').addClass('list-group-item');});
    $('#grid').click(function(event){event.preventDefault();$('#products .item').removeClass('list-group-item');$('#products .item').addClass('grid-group-item');});
});

</script>
</br></br></br></br></br></br></br>
<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>