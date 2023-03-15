<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="container-fluid">
  <div class="row">
    <nav class="col-md-2 d-none d-md-block sidebar mt-5 fixed-top" style="z-index: 100; top: 100px;">
      <div class="sidebar-sticky" style="display: flex; justify-content: end;">
        <ul class="nav flex-column">
        
        <!-- css로 맨 item 마다 맨 오른쪽에 > 표시 작성 필요 -->
          <li class="nav-item ml-0">
  			 <a class="nav-link text-dark" href="${ctxPath}/adminMain.do" style="text-decoration:none">마이페이지 &gt; </a>  
          </li>	
          <li class="nav-item ml-0">
  			 <a class="nav-link text-dark" href="${ctxPath}/categoryInput.do" style="text-decoration:none">카테고리 등록 &gt; </a>  
          </li>
          <li class="nav-item">
          <a class="nav-link text-dark" href="${ctxPath}/categoryList.do" style="text-decoration:none">카테고리 리스트 &gt;</a>
          </li>
          <li class="nav-item">
            <a class="nav-link text-dark" href="${ctxPath}/productInput.do" style="text-decoration:none">상품 등록 &gt;</a>
          </li>
          <li class="nav-item">
          	<a class="nav-link text-dark" href="${ctxPath}/productList.do" style="text-decoration:none">상품 리스트 &gt;</a>
          </li>
          <li class="nav-item">
          	<a class="nav-link text-dark" href="${ctxPath}/userMain.do" style="text-decoration:none">사용자 홈으로 가기 &gt;</a>
          </li>
          
        </ul>
      </div>
    </nav>
    <div class="col-md-8">
    		