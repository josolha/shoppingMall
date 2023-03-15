<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<c:set var="cnt" value="${cnt+1}"/>

  <div class="card <c:if test="${cnt%5 !=0}">me-4</c:if>" style="width:200px">
  	<!-- 이미지 -->
  
  	<a href="prodView.do?pNum=${pDto.PNum}&pSpec=${pDto.PSpec}" style="overflow:hidden; height :220px">
   	<img class="card-img-top" src="${ctxPath}/resources/file_repo/${pDto.PImage}" alt="Card image" style="width:100%; height :220px; background : #fcf9ee">
   </a>
   
   <div class="card-body" style="background : #fcf9ee">
     <h4 class="card-title" style="font-size:15px; overflow:hidden;
     	text-overflow:ellipsis; white-space:nowrap">Name : ${pDto.PName}</h4>
     	
     <h4 class="card-text" style="font-size:15px;">Price : <fmt:formatNumber type="Number" value="${pDto.price}"/>₩</h4>
     <h4 class="card-text" style="font-size:15px;" >Point : <fmt:formatNumber type="Number" value="${pDto.PPoint}"/>p</h4>
     
     <!-- 로그인 되었을 경우 -->
     <%-- <c:if test="${sessionScope.isLogin != null}">
     <a href="cartAdd.do?pNum=${pDto.pNum}&pQty=1&pSpec=${pDto.pSpec}" class="btn btn-outline-info" style="width:100%">장바구니 담기	</a>
     </c:if>
     
     <!-- 로그인 안되었을 경우 -->
     <c:if test="${sessionScope.isLogin == null}">
     <a href="javascript:alert('로그인이 필요합니다')" class="btn btn-outline-info" style="width:100%">장바구니 담기	</a>
     </c:if>  --%> 
     
   </div>
   
 </div>
 
<c:if test="${cnt%5 == 0}">
		<!--card를 감싸는 div를 닫고 다시 감싸는 태그를 열어준다  -->
	 </div><div class="d-flex mt-4">
</c:if>