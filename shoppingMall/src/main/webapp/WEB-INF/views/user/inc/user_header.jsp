<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>        
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctxPath" value="${pageContext.request.contextPath}"/>    
    
<!DOCTYPE html>
<html>
<head>
  <title>사용자 Home</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="${ctxPath}/css/main.css">
  
     <script>
		$(document).ready(function(){
		  $("#productDropdown").click(function(){
		    $.ajax({
		      url: "${ctxPath}/admin/categorieSide",
		      success: function(result){
		        
		    	/* alert("성공"); */
		    	var categories = result;
		        
		        var dropdownItems = "";
		        categories.forEach(function(category) {
		          dropdownItems += '<a href="${ctxPath}/products/'+ category.code +'/all'+'" class="dropdown-item" href="#">' + category.cate_name + '</a>';
		        });
		        $("#drop").html(dropdownItems);
		   		 }
		      });
		    });
		  });
	</script>
</head>

<body style="background : #fcf9ee">
	<header>
	<nav class="navbar navbar-expand-lg" style="background : #fcf9ee">
	  <div class="container">
	    
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    
	    <div class="collapse navbar-collapse justify-content-center" id="mynavbar">
	    
	        <ul class="navbar-nav">
	        	<li class="nav-item">
	           		<a class="nav-link fs-6" href="${ctxPath}/products/0001/all">Home</a> 
	        	</li>
	        </ul>
	        
	        
			 <div class="col-3 col-md-10 me-auto" style="padding-left:140px;"> <!-- 그리드 시스템 추가 -->
	          <a class="text-black" href="${ctxPath}" style="text-decoration:none">
	            <p class="text-center mt-2">JO MALTWO</br> SEOUL</p>
	          </a>
	        </div>
		        
	        
	        <ul class="navbar-nav">
	        	
		  
		  
		        <%-- <c:if test="${sessionScope.isLogin != null}"> --%>
	     	    <li class="nav-item ">
		          <a class="nav-link" href="${ctxPath}/user/cart.do"><i class="bi bi-cart" style="vertical-align: middle;"></i></a>
		        </li>
	        
	        
		        <li class="nav-item dropdown">
	  				<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"><i class="bi bi-person fs-5" style="vertical-align: middle;"></i></a>
	  					<ul class="dropdown-menu">
	  						<c:if test="${sessionScope.loginDto.id == null}">
	    					<li><a class="dropdown-item" href="${ctxPath}/user/login.do">Login</a></li>
	    					<li><a class="dropdown-item" href="${ctxPath}/user/register.do">Register</a></li>
	    					</c:if>
	    					
	    					<c:if test="${sessionScope.loginDto.id != null}">    					
	    					<li><a class="dropdown-item" href="${ctxPath}/user/logout.do">Logout</a></li>
	    					<li><a class="dropdown-item" href="${ctxPath}/user/myPage.do">MyPage</a></li>    					
	    					</c:if>
	    					
	  					</ul>
				</li>
	      </ul>
	    </div>
	  </div>
	</nav>
	</header>
	
            
	