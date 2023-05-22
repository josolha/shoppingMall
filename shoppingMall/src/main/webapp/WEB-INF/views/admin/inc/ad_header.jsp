<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>        
<c:set var="ctxPath" value="${pageContext.request.contextPath}"/>    
    
<!DOCTYPE html>
<html>
<head>
  <title>관리자 Home</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
  <link rel="stylesheet" href="${ctxPath}/css/main.css">
  
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
	           		<a class="nav-link fs-6" href="${ctxPath}/admin/myPage.do">Home</a> 
	        	</li>
	        </ul>
	        
	        
			 <div class="col-3 col-md-10 ms-auto"> <!-- 그리드 시스템 추가 -->
	          <a class="text-black" href="${ctxPath}/admin/myPage.do" style="text-decoration:none">
	            <p class="text-center mt-2">JO MALTWO</br> SEOUL</p>
	          </a>
	        </div>
		        
	        
	        <ul class="navbar-nav">
	<%--     		<c:if test="${sessionScope.loginDto.id != null}">	        	
					<div class="navbar-nav ms-auto">
					  <li class="nav-item mt-3">
					    <span class="nav-link" style="color:black; line-height:40px; margin-right: 15px">
					      </i>안녕하세요 ${sessionScope.loginDto.name}님
					    </span>
					  </li>
					</div>
	        	</c:if>  --%>
	        	
		       
		        <%-- <c:if test="${sessionScope.isLogin != null}"> --%>
	     	    <li class="nav-item ">
		          <a class="nav-link" href="cartList.do"><i class="bi bi-cart" style="vertical-align: middle;"></i></a>
		        </li>
	        
	        
	        <!--ms - start,  me - end   -->
		        <li class="nav-item dropdown">
	  				<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"><i class="bi bi-person fs-5" style="vertical-align: middle;"></i></a>
	  					<ul class="dropdown-menu">
	  						<c:if test="${sessionScope.loginDto.id == null}">
	    					<li><a class="dropdown-item" href="${ctxPath}/admin/login.do">관리자 로그인</a></li>
	    					</c:if>
	    					
	    					<c:if test="${sessionScope.loginDto.id != null}">    					
	    					<li><a class="dropdown-item" href="${ctxPath}/admin/logout.do">관리자 로그아웃</a></li>    					
	    					</c:if>
	    					
	    					<li><a class="dropdown-item" href="">관리자 페이지</a></li>
	  					</ul>
				</li>
	      </ul>
	    </div>
	  </div>
	</nav>
	</header>
	          <%--  <div class="text-center">
                <img class="img-fluid" src="${ctxPath}/img/23B02_Landing-page_Hero_Desktop.jpg" alt="...">
            </div> --%>
            <!-- Sidebar -->
		
    
<!-- /#sidebar-wrapper -->
            
	