
    		
    		

  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="container-fluid">
  <div id="rowside"class="row">
    <nav class="col-md-2 d-none d-md-block sidebar mt-5 fixed-top" style="z-index: 100; top: 100px; ">
      <div class="sidebar-sticky" style="display: flex; justify-content: end;">
        <ul class="nav flex-column">
        
        <!-- css로 맨 item 마다 맨 오른쪽에 > 표시 작성 필요 -->
          <li class="nav-item ml-0">
  			 <a class="nav-link text-dark" href="${ctxPath}/admin/users.do" style="text-decoration:none">Users</a>  
          </li>	
          
          
	     <li class="nav-item dropdown">
		    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color: black;">
		        Category &nbsp; ▼
		    </a>
		    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
		        <a class="dropdown-item" href="${ctxPath}/admin/categoryInput.do">Register</a>
		        <a class="dropdown-item" href="${ctxPath}/admin/categoryList.do">List</a>
		    </div>
		 </li>
		 
		 
		   <li class="nav-item dropdown">
		    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color: black;">
		        Product &nbsp;  &nbsp; ▼
		    </a>
		    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
		        <a class="dropdown-item" href="${ctxPath}/admin/productInput.do">Register</a>
		        <a class="dropdown-item" href="${ctxPath}/admin/productList.do">List</a>
		    </div>
		 </li>
          
          
           <li class="nav-item">
            <a class="nav-link text-dark" href="${ctxPath}/board/list.do" style="text-decoration:none">Board</a>
          </li>
          
          <li class="nav-item">
            <a class="nav-link text-dark" href="${ctxPath}/admin/orderList.do" style="text-decoration:none">Orders</a>
          </li>
          
        </ul>
      </div>
    </nav>
    </div>
    </div>
 
		
    		