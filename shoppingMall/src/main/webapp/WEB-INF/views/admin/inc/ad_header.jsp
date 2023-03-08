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
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
  <script src="${ctxPath}/js/validChk2.js"></script>
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
	           		<a class="nav-link fs-6" href="${ctxPath}">홈으로</a> 
	        	</li>
	        </ul>
	        
	        <ul class="nav-item mt-3 me-auto ms-auto">
	          <a class="text-black" href="${ctxPath}" style="text-decoration:none"><p class="text-center">JO MALTWO</br> SEOUL</p></a>
	        </ul>
	        
 
        	
    <%-- 	   <c:if test="${sessionScope.isLogin == null}">
	       		 <li class="nav-item">
	          		<a class="nav-link" href="userLogin.do">로그인</a>
	        	</li>
	        	<li class="nav-item">
	          		<a class="nav-link" href="userJoin.do">회원가입</a>
	        	</li>		
        	</c:if> --%>
	        
	        <ul class="navbar-nav">
	        
	        
	    		<c:if test="${sessionScope.loginDto.id != null}">
	   	        	<li class="nav-item" style="color:black; line-height:40px">
		         		 ${sessionScope.loginDto.name}님 
		        	</li>
	        	</c:if> 
	        	
		        <li class="nav-item">
		          <a class="nav-link" href="javascript:void(0)"><i class="bi bi-search"style="vertical-align: middle;"></i></a>
		        </li>
		        <%-- <c:if test="${sessionScope.isLogin != null}"> --%>
	     	    <li class="nav-item ">
		          <a class="nav-link" href="cartList.do"><i class="bi bi-cart" style="vertical-align: middle;"></i></a>
		        </li>
	        
	        
	        <!--ms - start,  me - end   -->
	        <li class="nav-item dropdown">
  				<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"><i class="bi bi-person fs-5" style="vertical-align: middle;"></i></a>
  					<ul class="dropdown-menu">
  					
  					
  						<c:if test="${sessionScope.loginDto.id == null}">
    					<li><a class="dropdown-item" href="${ctxPath}/adminLogin.do">관리자 로그인</a></li>
  					    <li><a class="dropdown-item" href="${ctxPath}/adminOut.do">관리자 회원가입</a></li>
    					</c:if>
    					
    					<%-- <c:if test="${sessionScope.isLogin != null && sessionScope.memberInfo == 'user'}"> --%>
    					<li><a class="dropdown-item" href="${ctxPath}/adminLogout.do">관리자 로그아웃</a></li>
    					<%-- </c:if> --%>
    					
    					<%-- <c:if test="${sessionScope.isLogin != null && sessionScope.memberInfo == 'admin'}"> --%>
    						<li><a class="dropdown-item" href="">관리자 페이지</a></li>
    						
    					<%-- </c:if> --%>
  					</ul>
			</li>
	      </ul>
	    </div>
	  </div>
	</nav>
	          <%--  <div class="text-center">
                <img class="img-fluid" src="${ctxPath}/img/23B02_Landing-page_Hero_Desktop.jpg" alt="...">
            </div> --%>
	</header>