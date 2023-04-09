<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    


<%@ include file ="inc/user_header.jsp"%>

<%@ include file ="inc/user_sidebar.jsp"%>

					
						<h3 class="text-center text-decoration-underline">${map.cate_name}</h3> 		
							
							
						   <form id="searchForm" method="get" action="${ctxPath}/products/${cate_code}/${spec}">
			   
						      <div class="d-flex justify-content-center mt-5">
		
						         <input type="text" id="keyword" name="keyword" placeholder="상품 이름 찾기"
						            style="width:200px" class="form-control rounded-0 rounded-start" value="${map.keyWord}"/>
						            
						         <button class="btn btn-dark text white rounded-0 rounded-end"><i class="bi bi-search"></i></button>
						         
						      </div>
						      
						   </form>
						   <div class="d-flex justify-content-center align-items-center flex-wrap mt-5">
						   		<a href="${ctxPath}/products/${cate_code}/all" class="link-btn me-3 mb-3">All.</a>
							    <a href="${ctxPath}/products/${cate_code}/new" class="link-btn me-3 mb-3">New.</a>
							    <a href="${ctxPath}/products/${cate_code}/recommend" class="link-btn me-3 mb-3">Recommend.</a>
							    <a href="${ctxPath}/products/${cate_code}/hit" class="link-btn me-3 mb-3">Hit.</a>
							</div>
		
						<h4 class="mt-4">[${map.spec}]</h4><hr/>
						<!-- 카드를 감싸는 태그를 시작 -->  
						<div class="d-flex mt-3">  
							<c:set var="cnt" value="0"/>
							<c:forEach var="pDto" items="${map.product}">				
								<%@ include file="inc/prod_card.jsp" %>
							</c:forEach>
						</div>

					
	

<%@ include file ="inc/user_footer.jsp"%>