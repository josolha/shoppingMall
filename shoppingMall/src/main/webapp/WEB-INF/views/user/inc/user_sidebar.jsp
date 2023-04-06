<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="container-fluid">
  <div id="rowside"class="row">
    <nav class="col-md-2 d-none d-md-block sidebar mt-5 fixed-top" style="z-index: 100; top: 100px;">
      <div class="sidebar-sticky" style="display: flex; justify-content: end;">
        <ul class="nav flex-column">
        
        <!-- css로 맨 item 마다 맨 오른쪽에 > 표시 작성 필요 -->
          <li class="nav-item ml-0">
  			 <a class="nav-link text-dark" href="${ctxPath}/myPage.do" style="text-decoration:none">My Page</a>  
          </li>	
          <li class="nav-item ml-0">
  			 <a class="nav-link text-dark" href="${ctxPath}/cart" style="text-decoration:none">My Cart</a>  
          </li>
  		<li class="nav-item">
          <a class="nav-link text-dark" href="${ctxPath}/board/list.do" style="text-decoration:none">Board</a>
          </li>
          <li class="nav-item">
          	<a class="nav-link text-dark" href="${ctxPath}/user/products.do" style="text-decoration:none">Recommend  </a>
          </li>
          
          <li class="nav-item">
          	<a class="nav-link text-dark" href="${ctxPath}/checkout.do" style="text-decoration:none">All Product</a>
          </li>
          
          <li class="nav-item">
          	<a class="nav-link text-dark" href="${ctxPath}/checkout.do" style="text-decoration:none">Order</a>
          </li>
         
        </ul>
      </div>
    </nav>
    <div class="container mt-5  col-md-8 mx-auto">
   <div class="border shadow-sm p-5 mb-3 w-100"> 		